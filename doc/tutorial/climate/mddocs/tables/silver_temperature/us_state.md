# Column silver_temperature.us_state

## Overview of column us_state in table silver_temperature 

|                               |                        |
| ----------------------------- | ---------------------- |
| Table                         | [silver_temperature](../silver_temperature.html)           |
| Qualified name                | silver_temperature.us_state  |
| Datatype                      | VARCHAR(2)        |
| Column type | computed |


US State




## Expressions

```sql
SELECT public.zip_to_state(EXTRACT(YEAR FROM date)::INT, zcta)
```

---
<object data="/Users/misha/harvard/projects/github/dorieh/doc/tutorial/climate/mddocs/tables/silver_temperature/us_state.svg" type="image/svg+xml"></object>
