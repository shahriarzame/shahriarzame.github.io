# shahriarzame.github.io

Personal academic website for Shahriar Iqbal Zame, built with Hugo + Wowchemy and deployed to GitHub Pages.

## Stack
- Hugo `0.119.0` (extended)
- Wowchemy modules via Go modules
- GitHub Actions for build/deploy

## Local Development
```powershell
hugo server
```

## Production Build
```powershell
hugo --gc --minify -b https://shahriarzame.github.io/
```

## Deployment
- Pushes to `main` trigger [publish workflow](./.github/workflows/publish.yaml).
- Pull requests to `main` run [PR quality checks](./.github/workflows/pr-quality.yml).

## Content Policy
- Active, publicly surfaced sections: `authors/admin`, `projects`, `publication`, `regular_post`.
- Legacy sections (`teaching`, `data`, `notes_in_r`) are preserved in repo history but archived from active discovery.

## Front Matter Contract (Visible Content)
Required fields:
- `title`
- `date`
- `summary` (non-empty)
- `authors` (non-empty)
- `tags` (non-empty)

Recommended fields:
- `lastmod`
- `image.alt` via figure shortcodes
- `doi`, `url_pdf`, `url_code` where available

## Branch Workflow
1. Branch from `main` (for example, `feat/site-phaseX-*`).
2. Open PR into `main`.
3. Ensure checks pass: `hugo-build`, `frontmatter-check`, `link-check`.
4. Use squash merge.
