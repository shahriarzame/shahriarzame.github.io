# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working in this repository.

## Project Snapshot

- Personal academic website for Shahriar Iqbal Zame.
- Built with Hugo + Wowchemy modules.
- Primary deployment target: GitHub Pages.
- Canonical URL: `https://shahriarzame.github.io/`.

## Stack and Version Pins

- Hugo (extended) is pinned to `0.119.0` in CI and Netlify config.
- Theme/modules are managed with Go modules in `go.mod`:
  - `github.com/wowchemy/wowchemy-hugo-themes/modules/wowchemy-bootstrap/v5 v5.9.2`
  - `github.com/wowchemy/wowchemy-hugo-themes/modules/wowchemy-plugin-netlify`
  - `github.com/wowchemy/wowchemy-hugo-themes/modules/wowchemy-plugin-reveal`
- Config is split across:
  - `config/_default/config.yaml`
  - `config/_default/params.yaml`
  - `config/_default/menus.yaml`
  - `config/_default/languages.yaml`

### Compatibility Note

- CI is pinned to Hugo `0.119.0`; newer local Hugo versions may fail with module incompatibilities.
- If local `hugo` is newer and fails, use pinned local validation:

```powershell
go run github.com/gohugoio/hugo@v0.119.0 --gc --minify --baseURL https://example.org/
```

## Key Commands

### Local Development

```powershell
hugo server
```

### Production Build

```powershell
hugo --gc --minify -b https://shahriarzame.github.io/
```

### Repo Quality Checks

```powershell
pwsh -NoProfile -File scripts/check-frontmatter.ps1
pwsh -NoProfile -File scripts/check-links.ps1
```

## Deployment and CI

### GitHub Pages (Primary)

- Workflow: `.github/workflows/publish.yaml`
- Trigger: push to `main` or manual dispatch.
- Build job uses Hugo `0.119.0` extended and deploys via `actions/deploy-pages@v4`.

### PR Validation

- Workflow: `.github/workflows/pr-quality.yml`
- Trigger: pull requests targeting `main`.
- Jobs/check names:
  - `hugo-build`
  - `frontmatter-check`
  - `link-check`

### Netlify (Secondary/Optional)

- Config: `netlify.toml`
- Build command: `hugo --gc --minify -b $URL`
- Environment pin: `HUGO_VERSION = "0.119.0"`

## Repository Structure

- `content/authors/admin/`: primary author profile.
- `content/projects/`: project detail pages.
- `content/publication/`: publication pages.
- `content/regular_post/`: blog/news posts.
- `content/gallery/`: dedicated gallery page.
- `static/uploads/`: downloadable assets (including CV PDFs).
- `layouts/partials/hooks/body-end/cv-links.html`: custom JS hook for CV link behavior.
- `scripts/`: repository checks used by CI.

## Content and Navigation Model

- Main menu (`config/_default/menus.yaml`) points to:
  - `/projects/`
  - `/publication/`
  - `/regular_post/`
  - `/gallery/`
  - `/uploads/resume.pdf`
- Homepage layout is defined in `content/_index.md` and includes hero, biography, selected collections, gallery block, and contact block.

## Legacy Content Policy

- Legacy sections are intentionally archived:
  - `content/teaching/`
  - `content/data/`
  - `content/notes_in_r/`
- Their `_index.md` files use `_build` controls (`render: never`, `list: never`) and sitemap/list suppression.
- Governance page: `content/legacy-archive.md`.

## Front Matter Contract (Enforced by Script)

For active content under:
- `content/regular_post/**/index.md`
- `content/publication/**/index.md`
- `content/projects/*.md` (excluding `_index.md`)

Required:
- `title` (non-empty)
- `date` (non-empty)
- `summary` (non-empty)
- `authors` (non-empty list)
- `tags` (non-empty list)

## Link and Asset Validation Rules (Enforced by Script)

`scripts/check-links.ps1` validates:
- Hugo `figure` shortcode image sources.
- Hugo `staticref` targets.
- Markdown links to local files.
- Uploaded asset references in `config/_default/menus.yaml` (e.g., CV link).

## Analytics

- GA4 is configured via `config/_default/params.yaml`:
  - `marketing.analytics.google_analytics`
- Do not manually paste an extra Google tag snippet into templates when this field is set.
- Current theme analytics partial injects gtag in production and includes outbound link click tracking.
- `features.privacy_pack.enable` is enabled in params, which applies privacy-oriented GA config from the theme partial.

## Custom Behavior

- `layouts/partials/hooks/body-end/cv-links.html` forces CV links (`/uploads/resume.pdf`) to open in a new tab with `rel="noopener"`.

## Contributor Workflow

1. Branch from `main`.
2. Open PR to `main`.
3. Ensure all PR checks pass (`hugo-build`, `frontmatter-check`, `link-check`).
4. Use squash merge.

## Removed/Not Present

- Hugo modules require internet connection for first build (uses goproxy.cn)
- Extended Hugo version is mandatory for SCSS compilation
- CI and deploy workflows are pinned to Hugo `0.119.0`; local newer Hugo versions may fail with theme module incompatibilities
- The `admin` keyword in publications references the site owner
- Images for publications go in `content/publication/<pub-name>/` directory
- Static files (PDFs, images) go in `static/` directory
- Keep `Projects`, `Publications`, and `Gallery` menu links as dedicated routes in `config/_default/menus.yaml`; do not switch them back to hash anchors unless intentionally reverting navigation behavior
