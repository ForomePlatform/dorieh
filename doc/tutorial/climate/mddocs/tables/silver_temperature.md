# View silver_temperature

## Overview for silver_temperature

Maximum daily temperature for US Zip Code Tabulation Areas, enriched and harmonized


Transformed from [bronze_temperature](bronze_temperature.html)


<details>

<summary>SQL/DDL Statement</summary>

```sql
CREATE view  silver_temperature AS
SELECT
    tmmx,
	date,
	zcta,
	(tmmx - 273.15) AS temperature_in_C,
	((tmmx - 273.15)*9/5 + 32) AS temperature_in_F,
	public.zip_to_state(EXTRACT(YEAR FROM date)::INT, zcta) AS us_state,
	public.zip_to_city(EXTRACT(YEAR FROM date)::INT, zcta) AS city
FROM bronze_temperature;
COMMENT ON view silver_temperature IS 'CREATED BY Dorieh: {"version": "0.4.4", "url": "file:///Users/misha/harvard/projects/github/dorieh", "commit": null}. Created at 2025-12-22 17:12:48.792033';
```

</details>

---
## Columns:

| Column Name | Column Type | Datatype |
| --- | --- | --- |
| [city](silver_temperature/city.html) | computed | VARCHAR(128) |
| [date](silver_temperature/date.html) |  | string |
| [temperature_in_c](silver_temperature/temperature_in_c.html) | computed | float |
| [temperature_in_f](silver_temperature/temperature_in_f.html) | computed | float |
| [tmmx](silver_temperature/tmmx.html) |  | string |
| [us_state](silver_temperature/us_state.html) | computed | VARCHAR(2) |
| [zcta](silver_temperature/zcta.html) |  | string |


