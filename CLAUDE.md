# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an academic personal website built with Hugo using the Wowchemy Academic theme. The site is for Shahriar Iqbal Zame, a PhD candidate and Research Associate at TUM's Chair of Transportation Systems Engineering. The site is deployed to GitHub Pages at https://shahriarzame.github.io/.

## Key Commands

### Local Development
```bash
cd shahriarzame.github.io
hugo server
```

### Build Site
```bash
# Production build with minification
hugo --gc --minify -b https://shahriarzame.github.io/

# Development build
hugo
```

### Import Publications from BibTeX
```bash
# Requires: pip install academic==0.10.0
academic import publications.bib content/publication/ --compact
```

## Architecture

### Hugo Configuration
- **Framework**: Hugo v0.119.0 (extended version required)
- **Theme**: Wowchemy Academic (v5.9.2) via Hugo modules
- **Go Modules**: Uses Go 1.15+ module system for theme management
- Configuration is split across `config/_default/`:
  - `config.yaml`: Core Hugo settings, modules, taxonomies
  - `params.yaml`: Wowchemy theme parameters, appearance, SEO
  - `menus.yaml`: Navigation structure
  - `languages.yaml`: Internationalization settings

### Content Structure
- `content/authors/admin/`: Author profile (main site owner)
- `content/publication/`: Research publications (auto-generated from BibTeX)
- `content/projects/`: Project pages
- `content/regular_post/`: Blog posts and news items
- Content uses YAML front matter with Markdown body
- Publications reference the site owner as `admin` in author lists

### Deployment
- **Primary**: GitHub Actions workflow (`.github/workflows/publish.yaml`)
  - Triggers on push to `main` branch
  - Builds with Hugo 0.119.0 in production environment
  - Deploys to GitHub Pages via `actions/deploy-pages@v4`
- **Alternative**: Netlify support via `netlify.toml`
  - Command: `hugo --gc --minify -b $URL`
  - Same Hugo version (0.119.0)

### Publication Import Automation
- Workflow: `.github/workflows/import-publications.yml`
- Monitors `publications.bib` file for changes
- Uses `academic` CLI tool (Python package) to convert BibTeX to Markdown
- Auto-creates PR with imported publications

## Working with Content

### Adding Publications
1. Add entry to `publications.bib` (root directory)
2. GitHub Actions will automatically create a PR with converted Markdown
3. Or manually run: `academic import publications.bib content/publication/ --compact`

### Publication Front Matter Format
```yaml
title: "Publication Title"
authors: [Author Name, admin, Other Author]
date: YYYY-MM-DDTHH:MM:SS+00:00
doi: https://doi.org/...
publication_types: article-journal
publication: "Journal Name, Vol. X"
abstract: >-
  Multi-line abstract...
tags: [tag1, tag2]
```

### Author Profile
- Main profile: `content/authors/admin/_index.md`
- Includes social links, education, interests, bio
- Resume/CV should be placed at `static/uploads/resume.pdf`

## Important Notes

- Hugo modules require internet connection for first build (uses goproxy.cn)
- Extended Hugo version is mandatory for SCSS compilation
- The `admin` keyword in publications references the site owner
- Images for publications go in `content/publication/<pub-name>/` directory
- Static files (PDFs, images) go in `static/` directory
