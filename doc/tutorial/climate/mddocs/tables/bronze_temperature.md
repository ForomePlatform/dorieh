# Table bronze_temperature

## Overview for bronze_temperature

Maximum daily temperature for US Zip Code Tabulation Areas


Primary Key: zcta, date


<details>

<summary>SQL/DDL Statement</summary>

```sql
CREATE TABLE  bronze_temperature (
	tmmx FLOAT,
	date DATE,
	zcta INT,
	PRIMARY KEY (zcta, date)
);
COMMENT ON table bronze_temperature IS 'CREATED BY Dorieh: {"version": "0.4.4", "url": "file:///Users/misha/harvard/projects/github/dorieh", "commit": null}. Created at 2025-12-22 17:12:48.657861';
```

</details>

---
## Columns:

| Column Name | Column Type | Datatype |
| --- | --- | --- |
| [date](bronze_temperature/date.html) |  | date |
| [tmmx](bronze_temperature/tmmx.html) |  | float |
| [zcta](bronze_temperature/zcta.html) |  | int |


