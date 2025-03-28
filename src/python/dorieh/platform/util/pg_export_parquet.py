"""
A command line utility to export results of SQL query as Parquet files





"""

#  Copyright (c) 2024. Harvard University
#
#  Developed by Research Software Engineering,
#  Harvard University Research Computing and Data (RCD) Services.
#
#  Author: Michael A Bouzinier
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#           http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

import copy
import decimal
import logging
import os.path
from abc import ABC, abstractmethod
from argparse import ArgumentParser
from datetime import datetime
from typing import Dict, Callable, Optional, List, Tuple

import pyarrow as pa
import pyarrow.dataset as ds
from markdown.extensions.smarty import closeClass
from psycopg2.extras import RealDictCursor
from psycopg2.extensions import connection
from contextlib import contextmanager

from pyarrow import RecordBatch
from pyarrow.dataset import Scanner

from dorieh.platform import init_logging
from dorieh.platform.db import Connection
from dorieh.platform.util.export_args import parse_args
from dorieh.platform.util.query_builder import QueryBuilder
from dorieh.utils.profile_utils import qmem
from dorieh.utils.io_utils import sizeof_fmt


@contextmanager
def result_set(conn: connection, sql: str, cursor_name: str, batch_size: int):
    with conn.cursor(cursor_factory=RealDictCursor, name=cursor_name) as cursor:
        cursor.itersize = batch_size
        cursor.execute(sql)
        yield cursor


def index_of(text: str, token: str):
    return text.lower().find(token.lower())


class PgPqBase(ABC):
    def __init__(self, cnxn: connection, sql: str, destination: str):
        self.batch_size = 2000
        self.sql = sql
        self.connection = cnxn
        self.destination = destination
        self.partition_columns = []
        self.cur_partition = {}
        self.transformer: Optional[Callable] = None
        self.parquet_partitioning = None
        self.count = 0
        self.count_batches = 0
        self.column_types: Optional[Dict] = None
        self.schema: Optional[pa.Schema] = None
        self.max_mem = 0
        self.max_pa_mem = 0
        return

    def setup_schema(self):
        schema = []
        for c in self.get_metadata():
            schema.append((c[0], self.type_pg2pq(c[1])))
        self.column_types = {
            s[0]: s[1] for s in schema
        }
        self.schema = pa.schema(schema)
        logging.info("Metadata and schema has been set up")

    @classmethod
    def type_pg2pq(cls, vtype: str):
        if vtype in ['int2', 'int4', 'int8']:
            pa_type = pa.int32()
        elif vtype.startswith("int"):
            pa_type = pa.int64()
        elif vtype.startswith("bool"):
            pa_type = pa.bool_()
        elif vtype in ["str", "varchar", "text"]:
            pa_type = pa.string()
        elif vtype.startswith("float") or vtype in ["numeric"]:
            pa_type = pa.float64()
        elif vtype in ["date"]:
            pa_type = pa.date32()
        elif vtype in ["time"]:
            pa_type = pa.date64()
        elif vtype in ["timestamp", "timestamptz"]:
            pa_type = pa.timestamp('ms')       ## Spark does not support 'ns'
        elif vtype.startswith('_'):  # List
            velemtype = cls.type_pg2pq(vtype[1:])
            pa_type = pa.list_(velemtype)
        else:
            pa_type = pa.string()
        return pa_type

    def metadata_sql(self) -> str:
        idx = self.sql.lower().find("limit")
        if idx < 0:
            return self.sql + "\nLIMIT 0"
        i = idx
        for c in self.sql[idx + 5:]:
            if c.isdigit() or c.isspace():
                i += 1
                continue
            break
        sql = self.sql[:idx] + "LIMIT 0" + self.sql[i:]
        return sql

    def get_metadata(self) -> List[Tuple]:
        with self.connection.cursor() as cursor:
            cursor.execute(self.metadata_sql())
            columns = [(desc.name, desc.type_code) for desc in cursor.description]
            type_codes = list({str(c[1]) for c in columns})
            in_clause = "(" + ','.join(type_codes)  + ")"
            cursor.execute("SELECT oid, typname FROM pg_type WHERE oid in " + in_clause)
            mapping = {int(row[0]): row[1] for row in cursor}

            return [
                (c[0], mapping[c[1]].lower()) for c in columns
            ]

    def set_partitioning(self, columns: List[str]):
        types = []
        for c in columns:
            self.partition_columns.append(QueryBuilder.unquote(c))
            pa_type = self.column_types.get(c, self.column_types.get(QueryBuilder.unquote(c)))
            types.append(pa_type)
        self.cur_partition = {
            p: None for p in self.partition_columns
        }
        self.parquet_partitioning = ds.partitioning(
            pa.schema([
                (self.partition_columns[i], types[i])
                for i in range(len(types))
            ]), flavor="hive"
        )

    @abstractmethod
    def export(self):
        pass

    def dryrun(self):
        n = 10
        sql = self.sql 
        with result_set(self.connection, sql, "c12345", self.batch_size) as rs:
            rs_iterator = iter(rs)
            while True:
                try:
                    row = next(rs_iterator)  # Get the next item from the iterator
                    if n > 0:
                        print(row)
                    n -= 1
                except StopIteration:
                    break
                except Exception as e:
                    print(f"An error occurred: {e}")
                    raise 

    @classmethod
    def run(cls, arguments = None):
        if arguments is None:
            arguments = parse_args()
        if not arguments.table and arguments.sql:
            if os.path.isfile(arguments.sql):
                with open(arguments.sql) as inp:
                    sql = '\n'.join([line for line in inp])
            else:
                sql = arguments.sql
            cls.export_sql(arguments, sql)
        elif arguments.table:
            cls.export_table(arguments, arguments.table)
        elif arguments.schema:
            cls.export_schema(arguments)
        else:
            raise ValueError("Either of: sql, schema or table is required")
        logging.info("All done!")

    @classmethod
    def export_sql(cls, arguments, sql):
        with Connection(arguments.db, arguments.connection) as db:
            if arguments.hard:
                instance = PgPqPartitionedQuery(db, sql, arguments.output, arguments.partition)
            else:
                instance = PgPqSingleQuery(db, sql, arguments.output, mode="error")
                if arguments.partition:
                    instance.set_partitioning(arguments.partition)
            if not arguments.dryrun:
                instance.export()
            else:
                instance.dryrun()



    @classmethod
    def export_table(cls, arguments, table: str):
        logging.info("Exporting: " + table)
        with Connection(arguments.db, arguments.connection) as cnxn:
            query_builder = QueryBuilder(cnxn).add_table(table)
            sql = query_builder.query()
        if arguments.sql:
            sql += f"\n{arguments.sql}"
        cls.export_sql(arguments, sql)
        logging.info("Exporting: " + table + " DONE")

    @classmethod
    def export_schema(cls, arguments):
        with Connection(arguments.db, arguments.connection) as cnxn:
            tables = QueryBuilder.get_tables(cnxn, arguments.schema)
        for table in tables:
            a = copy.deepcopy(arguments)
            t = table.split('.')[-1]
            a.output = os.path.join(arguments.output, t)
            cls.export_table(a, table)


class PgPqSingleQuery(PgPqBase):
    def __init__(self, cnxn: connection, sql: str, destination: str, mode: str, schema: pa.Schema = None):
        super().__init__(cnxn, sql, destination)
        self.cursor_name = "parquet_query_" + str(datetime.now())\
            .replace(' ', '_').replace('-', '_').replace(':', '_').replace('.', '_')
        self.mode = mode
        self.partition: Optional[List[str]] = None
        if schema:
            self.schema = schema
        else:
            self.setup_schema()
        return

    @staticmethod
    def normalize_value(v):
        if isinstance(v, decimal.Decimal):
            return float(v)
        return v

    def transform(self, row: Dict) -> Dict:
        if self.transformer:
            row = self.transformer(row)
        return {p: self.normalize_value(row[p]) for p in row}

    def set_partitioning(self, columns: List[str], values:Optional[List] = None):
        super().set_partitioning(columns)
        self.partition = values
        return

    def export(self):
        self.count = 0
        logging.info("Starting export.")
        scanner = Scanner.from_batches(source=self.batches(), schema = self.schema)
        ds.write_dataset(
            data=scanner,
            base_dir=self.destination,
            partitioning=self.parquet_partitioning,
            format="parquet",
            existing_data_behavior=self.mode
        )
        logging.info(f"The data has been exported. Total records: {self.count}. "
                     + f"Max memory used: {sizeof_fmt(self.max_mem)}; "
                     + f"Max PyArrow memory: {sizeof_fmt(self.max_pa_mem)}")
        return 

    def batch(self, data: List[Dict]):
        if self.count_batches == 0:
            logging.info(f"Received the first batch of {str(len(data))} records.")
        self.count += len(data)
        self.count_batches += 1
        imem = qmem()
        bmem = pa.total_allocated_bytes()
        if imem > self.max_mem:
            self.max_mem = imem
        if bmem > self.max_pa_mem:
            self.max_pa_mem = bmem
        if self.batch_size > 100000 or (self.count_batches % 100) == 0:
            mem = sizeof_fmt(imem)
            pmem = sizeof_fmt(bmem)
            logging.info(
                f"Received the {self.count_batches}-th batch of {len(data)} records. "
                + f"Total count: {self.count}. Memory: total: {mem}; PyArrow: {pmem}"
            )
        return RecordBatch.from_pylist(mapping=data, schema=self.schema)

    def batches(self):
        with result_set(self.connection, self.sql, self.cursor_name, self.batch_size) as rs:
            data = []
            try:
                for row in rs:
                    if len(data) >= self.batch_size:
                        yield self.batch(data)
                        data.clear()
                    data.append(self.transform(row))
            except:
                raise 
            yield self.batch(data)


class PgPqPartitionedQuery(PgPqBase):
    def __init__(self, cnxn: connection, sql: str, destination: str, partition: List[str]):
        super().__init__(cnxn, sql, destination)
        self.partitions: List[Dict] = []
        self.setup_schema()
        self.set_partitioning(partition)
        return

    @staticmethod
    def qualify_column(sql: str, column: str, idx_select: int):
        i2 = index_of(sql, column)
        if i2 < 0:
            raise ValueError(f"Column {column} not found in SELECT clause")
        if i2 < idx_select:
            raise ValueError(f"Column {column} is found before SELECT clause")
        i = i2 - 1
        while sql[i].isspace():
            i -= 1
        if sql[i] == '.':
            j = i - 1
            while sql[j].isspace():
                j -= 1
            while sql[j].isalnum():
                j -= 1
            qualifier = sql[j:i].strip()
            return f"{qualifier}.{column}"
        else:
            return column

    def set_partition_values(self):
        i1 = index_of(self.sql, "select")
        if i1 < 0:
            raise ValueError("No SELECT clause")

        columns = [
            self.qualify_column(self.sql, c, i1) for c in self.partition_columns
        ]
        select = ','.join(columns)

        i3 = index_of(self.sql, "from")
        if i3 < 0:
            raise ValueError("No FROM clause")
        from_clause = self.sql[i3:]
        sql = f"""
        SELECT distinct {select} 
        {from_clause}
        """
        logging.info(sql)
        with self.connection.cursor(cursor_factory=RealDictCursor) as cursor:
            cursor.execute(sql)
            values = [row for row in cursor]
        logging.info(f"Retrieved {len(values)} values for columns {select}")
        self.partitions = values

    def set_partitioning(self, partition: List[str]):
        super().set_partitioning(partition)
        self.set_partition_values()
        return

    def export(self):
        self.count = 0
        i1 = index_of(self.sql, "select")
        for partition in self.partitions:
            where = " AND ".join(
                f"{self.qualify_column(self.sql, column, i1)}={partition[column]}" for column in partition
            )
            if index_of(self.sql, "where") > -1:
                sql = self.sql + "\nAND " + where
            else:
                sql = self.sql + "\nWHERE " + where
            executor = PgPqSingleQuery(self.connection, sql, self.destination, "delete_matching", self.schema)
            executor.parquet_partitioning = self.parquet_partitioning
            logging.info(f"Fetching partition: " + where)
            executor.export()
            self.count += executor.count
            if executor.max_mem > self.max_mem:
                self.max_mem = executor.max_mem
            if executor.max_pa_mem > self.max_pa_mem:
                self.max_pa_mem = executor.max_pa_mem
            logging.info(f"Done partition: {where}. Exported records: {executor.count}. Total records: {self.count}")
        logging.info(f"All partitions have been exported. Total records: {self.count}. "
                     + f"Max memory used: {sizeof_fmt(self.max_mem)}; "
                     + f"Max PyArrow memory: {sizeof_fmt(self.max_pa_mem)}")
        return 




if __name__ == '__main__':
    init_logging()
    PgPqBase.run()
