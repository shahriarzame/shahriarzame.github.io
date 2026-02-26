$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$errors = New-Object System.Collections.Generic.List[string]

function Resolve-StaticPath {
  param([string]$RelativeOrAbsolutePath)

  $trimmed = $RelativeOrAbsolutePath.TrimStart("/")
  return Join-Path $repoRoot ("static/" + $trimmed)
}

$contentFiles = @()
$contentFiles += Get-ChildItem (Join-Path $repoRoot "content/regular_post") -Recurse -File -Filter "index.md"
$contentFiles += Get-ChildItem (Join-Path $repoRoot "content/publication") -Recurse -File -Filter "index.md"
$contentFiles += Get-ChildItem (Join-Path $repoRoot "content/projects") -File -Filter "*.md" | Where-Object { $_.Name -ne "_index.md" }
$contentFiles += Get-Item (Join-Path $repoRoot "content/authors/admin/_index.md")

foreach ($file in $contentFiles) {
  $raw = Get-Content -Raw $file.FullName
  $rawNoComments = [regex]::Replace($raw, '(?s)<!--.*?-->', '')

  # Hugo figure shortcodes.
  [regex]::Matches($rawNoComments, '\{\{<\s*figure\s+[^>]*src="([^"]+)"[^>]*>\}\}') | ForEach-Object {
    $src = $_.Groups[1].Value
    if ($src -match '^(https?:)?//') { return }

    if ($src.StartsWith("/")) {
      $candidate = Resolve-StaticPath -RelativeOrAbsolutePath $src
    } else {
      $candidate = Join-Path $file.DirectoryName $src
    }

    if (-not (Test-Path $candidate)) {
      $errors.Add("$($file.FullName): missing figure source '$src'.")
    }
  }

  # Hugo staticref shortcodes.
  [regex]::Matches($rawNoComments, '\{\{<\s*staticref\s+"([^"]+)"') | ForEach-Object {
    $path = $_.Groups[1].Value
    $candidate = Resolve-StaticPath -RelativeOrAbsolutePath $path
    if (-not (Test-Path $candidate)) {
      $errors.Add("$($file.FullName): missing staticref target '$path'.")
    }
  }

  # Markdown links to local files.
  [regex]::Matches($rawNoComments, '\[[^\]]+\]\(([^)]+)\)') | ForEach-Object {
    $link = $_.Groups[1].Value.Trim()

    if ($link -match '^(https?:)?//|^mailto:|^#') { return }
    if ($link -match '\{\{<') { return }

    $clean = $link.Split(" ")[0].Trim()

    if ($clean -match '\.[A-Za-z0-9]{2,5}$') {
      if ($clean.StartsWith("/")) {
        $candidate = Resolve-StaticPath -RelativeOrAbsolutePath $clean
      } else {
        $candidate = Join-Path $file.DirectoryName $clean
      }

      if (-not (Test-Path $candidate)) {
        $errors.Add("$($file.FullName): missing local link target '$clean'.")
      }
    }
  }
}

# Validate uploaded asset links in navigation config.
$menuConfig = Join-Path $repoRoot "config/_default/menus.yaml"
$menuRaw = Get-Content -Raw $menuConfig
[regex]::Matches($menuRaw, 'url:\s*"?(/?uploads/[^"\s]+)"?') | ForEach-Object {
  $asset = $_.Groups[1].Value
  $candidate = Resolve-StaticPath -RelativeOrAbsolutePath $asset
  if (-not (Test-Path $candidate)) {
    $errors.Add("${menuConfig}: missing uploaded asset '$asset'.")
  }
}

if ($errors.Count -gt 0) {
  Write-Host "Internal link/media validation failed:"
  $errors | ForEach-Object { Write-Host " - $_" }
  exit 1
}

Write-Host "Internal link/media validation passed."
