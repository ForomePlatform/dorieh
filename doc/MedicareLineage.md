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

       

