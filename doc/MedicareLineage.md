# Data dictionary and lineage for Medicare processing

```{toctree}
---
maxdepth: 1
---
lineage/medicare.dot.md
lineage/table-list.md
lineage/column-list.md
members/domain_dictionary.md
```

The dictionary and the data lineage graphs are generated using the 
[Dorieh Data Dictionary tool](members/domain_dictionary).

```{note}
The committed lineage diagram sources under `doc/lineage/` are point-in-time
snapshots that cover only a subset of the tables and columns. The
column-level diagrams predate the OREC/CUREC redesign of the QC data model,
so none of them yet illustrate the consistency columns that redesign
introduced (`consistent_orec` in the `qc_enrl_bene` view and
`consistent_curec` on the `enrollments` table) or the removal of `orec`
from `enrollments`. They will be regenerated with the
[Dorieh Data Dictionary tool](members/domain_dictionary). Until then, the
[Medicare data model definition](members/medicare_yaml.md) is the
authoritative description of the current tables and columns; see
[Entitlement reason codes: OREC and CUREC](Medicare.md#entitlement-reason-codes-orec-and-curec)
for what changed and why.
```
              
The general structure of the generated dictionary is:

* Main [table-level data lineage diagram](lineage/medicare.dot.md) showing the order of the
  data processing and the dependencies between tables.
* If the diagram is generated using SVG format, then every table
  is clickable, linked to a file with the table description.
* Every table description file includes verbal description, SQL or DDL
  used to create the table and the list of all columns in the table.
  Each column is linked to another file with detailed description
  for this column.
* Each column description file contains a description of the column
  and a lineage diagram for teh column showing what columns in which tables
  have been used to compute the value of this column. The SVG
  diagram is clickable and every element is linked to the description
  file for the column.
* File, containing [alphabetical list of all columns in all tables](lineage/column-list.md).
  For every column a list of tables in which the column is present
  is displayed. During transformation process columns are
  transferred from one table to another, hence a column usually is present in
  multiple tables.

       

