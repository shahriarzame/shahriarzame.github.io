---
title: "Hosting and Presenting at the First SEE-FAr Workshop at TUM"
author: admin
date: 2026-07-16
slug: see-far-workshop-2026
categories: []
tags:
  - Workshop
  - SEE-FAr
  - Freight Electrification
  - Freight Automation
  - Road Freight
  - TUM
  - TSE
  - BOKU
  - DFG
  - FWF
subtitle: "Recent Advances in Electric and Automated Road Freight Transport"
summary: "Recap of the first SEE-FAr workshop at TUM, which brought together the project team from TUM and BOKU with invited international experts on road freight electrification and automation."
authors: [admin]
lastmod: 2026-07-21T00:00:00+00:00
featured: false
image:
  caption: "SEE-FAr project team and invited speakers at TUM, 16 July 2026"
  focal_point: "Center"
  preview_only: false
projects: []

output:
  blogdown::html_page:
    toc: true
    toc_depth: 4
---

### A Full Day on Freight Decarbonisation

On **16 July 2026**, the **Chair of Transportation Systems Engineering (TSE)** at the **Technical University of Munich** hosted the first workshop of the **Shaping E-Roads Efficiency for Freight Automation (SEE-FAr)** project, under the title *Recent Advances in Electric and Automated Road Freight Transport*.

SEE-FAr is jointly funded by the **German Research Foundation (DFG)** and the **Austrian Science Fund (FWF)**, and is jointly led by **Prof. Dr. Constantinos Antoniou** (TUM) and **Prof. Dr. Yusak Susilo** (BOKU University, Vienna). The hybrid workshop brought the project team together with invited academic experts and industry stakeholders around a single question: *how do we actually decarbonise road freight?*

It was a privilege to take part both as a member of the **organising team** and as one of the **presenters**.

### My Presentation

{{< figure src="presentation.jpg" alt="Presenting freight OD estimation results at the SEE-FAr workshop" >}}

I presented **"Freight OD Estimation from Fleet GPS and Traffic Counts: What Bavaria Validated and Austria Taught Us."**

The talk addressed a practical tension in freight demand estimation: commercial-fleet GPS probes are spatially rich but penetration-biased, while roadside counts are sparse but trusted. Our pipeline treats GPS stop sequences as origin–destination priors and calibrates them against permanent count stations through a regularised observation-matrix inversion, producing truck demand at NUTS-3 resolution and hourly granularity.

The two study regions behaved very differently, and that contrast became the heart of the talk. Bavaria reproduced independent counts to within roughly **1% aggregate bias**, whereas Austria **over-predicted by about 2.5×**. Rather than tuning the discrepancy away, we traced its mechanism — where too few instrumented links constrain an OD pair, the estimate collapses back onto the GPS prior, and that prior is itself inflated by repeated intra-zonal delivery stops. The contribution is therefore not just a method, but a set of diagnostics that let the resulting matrix label its own identifiability and spatial reliability.

### Programme Highlights

**Part A — SEE-FAr project presentations**

- **Prof. Dr. Yusak Susilo** (BOKU) — SEE-FAr project overview
- **Denissa Purba** (BOKU) — Operational patterns and impact analysis of long-haul road freight in Bavaria and Austria
- **Shahriar Iqbal Zame** (TUM) — Data-driven estimation of vehicle-based freight OD matrices
- **Wanrong Hu** (BOKU) — Charging facilities allocation for battery-electric freight corridors: plug-in charging, battery swapping, and electric road systems

**Part B — Invited expert perspectives**

- **Fabian Bussieweke and Niclas Klein** (TUM) — Long-haul road freight electrification and automation: technical implications from a system perspective
- **Dr. Muhamad Rizki** (ITENAS) — Factors influencing light-duty electric truck adoption in urban logistics
- **Dr. Oleksandr Rossolov** (Dalhousie University) — Toward spatially equitable public EV charging infrastructure: urban–rural differences in location preferences
- **Dr. Trilce Encarnación** (University of Missouri–St. Louis) — Pricing delivery demand: a complement to freight electrification

The day closed with an open discussion on research needs, implementation barriers, and collaboration opportunities, chaired by Prof. Antoniou and Prof. Susilo.

{{< figure src="session.jpg" alt="Hybrid workshop session at TUM with on-site and remote participants" >}}

### Reflections

What struck me most was how naturally the sessions converged. The talks approached freight decarbonisation from genuinely different angles — trajectory data and OD estimation, corridor-level charging infrastructure, behavioural adoption among truck operators, spatial equity in charging access, and demand-side pricing — yet they kept arriving at the same conclusion: **no single technology resolves this on its own**. Data, behaviour, infrastructure, and policy have to work in concert.

Hosting an event like this is also a reminder of how much the informal parts matter. Some of the most useful exchanges happened over the coffee break and at the dinner afterwards, where the questions get blunter and the open problems get named directly.

Many thanks to the SEE-FAr team at TUM and BOKU, to our invited speakers for travelling and dialling in, and to DFG and FWF for supporting the project. Looking forward to the next one. 🚚⚡
