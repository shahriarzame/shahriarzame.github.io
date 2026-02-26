$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$errors = New-Object System.Collections.Generic.List[string]

function Get-FrontMatter {
  param([string]$Text)
  $m = [regex]::Match($Text, "(?s)^---\s*\r?\n(.*?)\r?\n---")
  if ($m.Success) { return $m.Groups[1].Value }
  return $null
}

function Has-NonEmptyList {
  param(
    [string]$FrontMatter,
    [string]$Key
  )

  if ([regex]::IsMatch($FrontMatter, "(?m)^${Key}:\s*\[\s*\]\s*$")) {
    return $false
  }

  $inline = [regex]::Match($FrontMatter, "(?m)^${Key}:\s*\[(.*?)\]\s*$")
  if ($inline.Success) {
    return -not [string]::IsNullOrWhiteSpace($inline.Groups[1].Value)
  }

  $block = [regex]::Match($FrontMatter, "(?ms)^${Key}:\s*\r?\n((?:\s*-\s+.*\r?\n)+)")
  if ($block.Success) {
    return $true
  }

  return $false
}

function Has-NonEmptyScalar {
  param(
    [string]$FrontMatter,
    [string]$Key
  )

  $m = [regex]::Match($FrontMatter, "(?m)^${Key}:\s*(.*)$")
  if (-not $m.Success) {
    return $false
  }

  $value = $m.Groups[1].Value.Trim()
  if ($value -in @("", '""', "''", "[]")) {
    return $false
  }

  if ($value -in @("|", "|-", ">", ">-")) {
    $block = [regex]::Match($FrontMatter, "(?ms)^${Key}:\s*(?:\||\|-|>|>-)\s*\r?\n((?:[ \t].*\r?\n)+)")
    if (-not $block.Success) {
      return $false
    }
    return -not [string]::IsNullOrWhiteSpace($block.Groups[1].Value)
  }

  return $true
}

$targets = @()
$targets += Get-ChildItem (Join-Path $repoRoot "content/regular_post") -Recurse -File -Filter "index.md"
$targets += Get-ChildItem (Join-Path $repoRoot "content/publication") -Recurse -File -Filter "index.md"
$targets += Get-ChildItem (Join-Path $repoRoot "content/projects") -File -Filter "*.md" | Where-Object { $_.Name -ne "_index.md" }

foreach ($file in $targets) {
  $raw = Get-Content -Raw $file.FullName
  $fm = Get-FrontMatter -Text $raw

  if (-not $fm) {
    $errors.Add("$($file.FullName): missing YAML front matter.")
    continue
  }

  if (-not (Has-NonEmptyScalar -FrontMatter $fm -Key "title")) {
    $errors.Add("$($file.FullName): title must be present and non-empty.")
  }
  if (-not (Has-NonEmptyScalar -FrontMatter $fm -Key "date")) {
    $errors.Add("$($file.FullName): date must be present and non-empty.")
  }
  if (-not (Has-NonEmptyScalar -FrontMatter $fm -Key "summary")) {
    $errors.Add("$($file.FullName): summary must be present and non-empty.")
  }
  if (-not (Has-NonEmptyList -FrontMatter $fm -Key "authors")) {
    $errors.Add("$($file.FullName): authors list must be present and non-empty.")
  }
  if (-not (Has-NonEmptyList -FrontMatter $fm -Key "tags")) {
    $errors.Add("$($file.FullName): tags list must be present and non-empty.")
  }
}

if ($errors.Count -gt 0) {
  Write-Host "Front matter validation failed:"
  $errors | ForEach-Object { Write-Host " - $_" }
  exit 1
}

Write-Host "Front matter validation passed."
