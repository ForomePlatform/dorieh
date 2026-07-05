# About the Companion Book

This documentation and the book *Research Data that Can Be Trusted*
describe the same open-source platform and are written by the same
authors. The two are designed to complement each other: the
documentation is self-contained and free — every page can be read,
and every example can be run, using only the code, configuration and
synthetic data in this repository — while the book offers an extended
conceptual treatment of the ideas behind the platform, including data
provenance, the regulatory context for health data, and a taxonomy of
data transformations. The book is optional enrichment; it is never a
prerequisite for anything in this documentation.

## Bibliographic information

* Title: *Research Data that Can Be Trusted*
* Authors: Bouzinier et al.
* Series: SpringerBriefs in Computer Science
* Publisher: Springer, 2026
* Link: <https://tidd.ly/4y1ClDH>

```{image} img/awin_qrcode.png
---
alt: QR code linking to the book Research Data that Can Be Trusted
target: https://tidd.ly/4y1ClDH
width: 160px
---
```

Scan the QR code (or follow the link above) to get the book.

## Chapter-to-documentation map

Each book chapter has a single canonical landing page in this
documentation:

| Book chapter                                                | Documentation page                                                                     |
|-------------------------------------------------------------|----------------------------------------------------------------------------------------|
| Ch. 5, "Language Design"                                    | [Concepts: the Dorieh approach](concepts.md)                                           |
| Ch. 6, "Proof of Concept Implementation"                    | [Concepts: the Dorieh approach](concepts.md)                                           |
| Ch. 7, "Sample Application: Building ML-Ready Datasets"     | [Building a Bronze–Silver–Gold climate pipeline](tutorial/climate/building-climate-pipeline.md) |
| Ch. 8, "Dorieh Medicare Claims Data Pipeline"               | [Medicare case study](Medicare.md) and the [Medicare pipeline tutorial](tutorial/medicare/building-medicare-pipeline.md) |
| Appendix A (core YAML DSL syntax)                           | [Data modelling reference](Datamodels.md)                                              |
| Appendix B (DSL extensions)                                 | [Data modelling extensions](DataModellingExtensions.md)                                |

## Using this documentation without the book

If you do not have the book, the following reading order covers the
same ground end to end:

1. Start with [Concepts: the Dorieh approach](concepts.md) for the
   vocabulary and design ideas used throughout the documentation.
2. Work through the
   [climate tutorial](tutorial/climate/building-climate-pipeline.md),
   a runnable Bronze–Silver–Gold pipeline built on open data.
3. Read the [Medicare case study](Medicare.md) to see the same
   patterns applied to a production-scale health data pipeline
   (runnable with synthetic data).
4. Consult the DSL reference — [Data modelling](Datamodels.md) and
   [Data modelling extensions](DataModellingExtensions.md) — when you
   write your own data models.
