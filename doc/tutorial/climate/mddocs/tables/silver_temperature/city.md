# Column silver_temperature.city

## Overview of column city in table silver_temperature 

|                               |                        |
| ----------------------------- | ---------------------- |
| Table                         | [silver_temperature](../silver_temperature.html)           |
| Qualified name                | silver_temperature.city  |
| Datatype                      | VARCHAR(128)        |
| Column type | computed |


Name of a representative city for the ZIP Code Tabulation Area (ZCTA);  for ZCTAs spanning multiple cities, this is the city covering the largest  portion of the area or population.





## Expressions

```sql
SELECT public.zip_to_city(EXTRACT(YEAR FROM date)::INT, zcta)
```

---
<object data="/Users/misha/harvard/projects/github/dorieh/doc/tutorial/climate/mddocs/tables/silver_temperature/city.svg" type="image/svg+xml"></object>
