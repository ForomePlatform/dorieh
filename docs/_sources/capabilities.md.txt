# Platform Capabilities

This section collects cross-cutting how-to guides for working with a
deployed Dorieh data platform. Unlike the flagship
[climate tutorial](tutorial/climate/building-climate-pipeline.md) and the
[Medicare case study](Medicare.md), which each walk through building one
pipeline end to end, the pages below apply regardless of which data
domain you are working with: querying the database, monitoring its
activity, and describing user requests for research data.

```{toctree}
---
maxdepth: 1
caption: Capabilities
---
How to query the database <SampleQuery>
Querying Medicaid Data <QueringMedicaid>
Monitoring database activity <MonitoringDB>
Approximate distinct counting with HLL <UsingHLL>
Handling user requests <UserRequests>
Example user request <example_request_yaml>
```

What each guide covers:

* [How to query the database](SampleQuery.md) — sample SQL against the
  warehouse, including joins across domains.
* [Querying Medicaid Data](QueringMedicaid.md) — a discussion of
  querying health data specifically, with its privacy caveats.
* [Monitoring database activity](MonitoringDB.md) — Dorieh utilities
  for watching long-running database operations such as indexing.
* [Approximate distinct counting with HLL](UsingHLL.md) — how the QC
  tables use HyperLogLog sketches to count distinct beneficiaries
  cheaply.
* [Handling user requests](UserRequests.md) and the
  [example request](example_request_yaml.md) — describing research
  data requests declaratively in YAML.

Beyond the flagship climate and Medicare examples, Dorieh also
supports additional data domains: [exposure data](exposures.md) from
the Atmospheric Composition Analysis Group of Washington University in
St. Louis, [Environmental Protection Agency (EPA) data](epa.md), and
[demographics data from the US Census](census.rst). These and the
other subject areas are listed on the [Data Domains](domains.md) page.
