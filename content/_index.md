---
# Leave the homepage title empty to use the site title
title: ''
date: 2022-10-24
type: landing

sections:
  - block: hero
    content:
      title: Data-Driven Transportation Research for Decarbonized Freight
      cta:
        label: Download CV
        url: /uploads/resume.pdf
      cta_alt:
        label: Contact
        url: '#contact'
      text: |-
        I am a doctoral candidate at TUM working at the intersection of **agent-based simulation**, **optimization**, and **behavioral modelling** for freight electrification and automation.

        This site highlights my research outputs, applied projects, and professional updates for both academic and industry audiences.
    design:
      background:
        gradient_end: '#005a63'
        gradient_start: '#0f2b46'
        text_color_light: true

  - block: about.biography
    id: about
    content:
      title: Biography
      username: admin

  - block: markdown
    id: impact
    content:
      title: Research Impact and Industry Relevance
      subtitle: ''
      text: |-
        - **System-level analysis for freight transition**: evaluating electrification and automation pathways under realistic operational constraints.
        - **Decision support**: translating simulation and optimization outputs into policy and infrastructure insights.
        - **Applied methods**: combining MATSim-based modelling, discrete choice analysis, and data-driven scenario evaluation.
    design:
      columns: '2'

  - block: collection
    id: projects
    content:
      title: Projects
      subtitle: ''
      text: Selected projects with methodological depth and practical relevance.
      count: 4
      filters:
        folders:
          - projects
        author: ""
        category: ""
        tag: ""
        exclude_featured: false
        exclude_future: false
        exclude_past: false
        publication_type: ""
      offset: 0
      order: desc
    design:
      view: compact
      columns: '2'

  - block: collection
    id: publication
    content:
      title: Selected Research Outputs
      subtitle: Journal articles, working papers, and thesis outputs
      text: ''
      count: 6
      filters:
        folders:
          - publication
        exclude_featured: true
      offset: 0
      order: desc
    design:
      columns: '2'
      view: citation

  - block: markdown
    id: service
    content:
      title: Academic Service
      subtitle: ''
      text: |-
        Peer review for international journals and conferences.

        - **Journal of Urban Mobility** (Elsevier) — 2 manuscripts reviewed, 2026
        - **28th EURO Working Group on Transportation Meeting (EWGT 2026)**, Kraków, Poland — 5 manuscripts reviewed, 2026

        Journal review record verified via [ORCID](https://orcid.org/0000-0002-7323-9771).
    design:
      columns: '2'

  - block: collection
    id: regular_post
    content:
      title: Blog
      subtitle: Professional updates and reflections
      text: ''
      count: 3
      filters:
        folders:
          - regular_post
        author: ""
        category: ""
        tag: ""
        exclude_featured: false
        exclude_future: false
        exclude_past: false
        publication_type: ""
      offset: 0
      order: desc
    design:
      view: compact
      columns: '2'

  - block: markdown
    id: gallery
    content:
      title: Gallery
      subtitle: 'Photos by Shahriar'
      text: |-
        {{< gallery album="photos" >}}
    design:
      columns: '2'

  - block: contact
    id: contact
    content:
      title: Contact
      subtitle: Collaborations, research discussions, and industry partnerships
      email: shahriar.zame@tum.de
      address:
        street: Parkring 37
        city: Garching
        postcode: 85748
        country: Germany
        country_code: DE
      autolink: true
    design:
      columns: '2'
---
