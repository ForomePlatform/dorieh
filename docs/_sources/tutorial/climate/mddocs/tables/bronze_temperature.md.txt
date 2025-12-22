# Table bronze_temperature

## Overview for bronze_temperature


```{toctree}
---
maxdepth: 1
hidden:
---
bronze_temperature/date.md
bronze_temperature/tmmx.md
bronze_temperature/zcta.md
```


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
COMMENT ON table bronze_temperature IS 'CREATED BY Dorieh: {"version": "0.4.4", "url": "file:///Users/misha/harvard/projects/github/dorieh", "commit": null}. Created at 2025-12-22 18:20:47.129217';
```

</details>

---
## Columns:

| Column Name | Column Type | Datatype |
| --- | --- | --- |
| [date](bronze_temperature/date.md) |  | date |
| [tmmx](bronze_temperature/tmmx.md) |  | float |
| [zcta](bronze_temperature/zcta.md) |  | int |


