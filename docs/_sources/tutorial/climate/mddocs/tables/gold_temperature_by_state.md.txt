# Materialized view gold_temperature_by_state

## Overview for gold_temperature_by_state

Temperature variations by US State


Aggregated from [silver_temperature](silver_temperature.html) on On us_state, date

Primary Key: us_state, date


<details>

<summary>SQL/DDL Statement</summary>

```sql

CREATE materialized view  gold_temperature_by_state AS
SELECT
    us_state,
	date,
	MAX(tmmx) - MIN(tmmx) AS t_span,
	AVG(temperature_in_C) AS t_mean_in_C,
	AVG(temperature_in_F) AS t_mean_in_F
FROM silver_temperature

WHERE us_state IS NOT NULL AND date IS NOT NULL
GROUP BY us_state,date;

COMMENT ON materialized view gold_temperature_by_state IS 'CREATED BY Dorieh: {"version": "0.4.4", "url": "file:///Users/misha/harvard/projects/github/dorieh", "commit": null}. Created at 2025-12-22 17:12:48.792207';
```

</details>

---
## Columns:

| Column Name | Column Type | Datatype |
| --- | --- | --- |
| [date](gold_temperature_by_state/date.html) | grouping | string |
| [t_mean_in_c](gold_temperature_by_state/t_mean_in_c.html) | computed | float |
| [t_mean_in_f](gold_temperature_by_state/t_mean_in_f.html) | computed | float |
| [t_span](gold_temperature_by_state/t_span.html) | computed | float |
| [us_state](gold_temperature_by_state/us_state.html) | grouping | string |


