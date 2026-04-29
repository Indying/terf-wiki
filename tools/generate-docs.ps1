$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$refRoot = Join-Path $repoRoot "ref\terf"
$outputRoot = Join-Path $repoRoot "entries"

if (-not (Test-Path $refRoot)) {
  throw "Expected TERF reference data at $refRoot"
}

New-Item -ItemType Directory -Force -Path $outputRoot | Out-Null
Get-ChildItem -Path $outputRoot -Recurse -File -Filter *.html -ErrorAction SilentlyContinue | Remove-Item -Force

$categoryOrder = @(
  "Machines",
  "Items & Blocks",
  "Concepts & Systems",
  "Hazards",
  "World & Dimensions",
  "Media & Cosmetics"
)

$categoryPriority = @{
  "Machines" = 6
  "World & Dimensions" = 5
  "Hazards" = 4
  "Items & Blocks" = 3
  "Media & Cosmetics" = 2
  "Concepts & Systems" = 1
}

$categoryDescriptions = @{
  "Machines" = "Operational machinery and multiblock systems discovered in the TERF function tree."
  "Items & Blocks" = "Craftable items, placement blocks, and utility components surfaced through TERF recipes."
  "Concepts & Systems" = "Gameplay systems, scripted entities, advancements, and mechanics that define how the pack behaves."
  "Hazards" = "Custom damage sources, failure modes, and environmental threats."
  "World & Dimensions" = "Dimensions, biomes, and timeline definitions that shape TERF's spaces."
  "Media & Cosmetics" = "Trim patterns, paintings, and jukebox songs included in the pack."
}

$titleOverrides = @{
  "arc_furnace" = "Arc Furnace"
  "aviators_sweet_dreams" = "Aviators - Sweet Dreams"
  "black_mesa_weve_got_hostiles_remix" = "Black Mesa - We've Got Hostiles Remix"
  "cd_recovery_compass" = "CD Recovery Compass"
  "ebf" = "EBF"
  "mcfr" = "MCFR"
  "multiblock_core" = "Multiblock Core"
  "no_oxygen" = "No Oxygen"
  "opencore" = "OpenCore"
  "stfr" = "STFR"
  "stfr_control_panel" = "STFR Control Panel"
  "tau_cannon" = "Tau Cannon"
  "terf" = "TERF"
  "warp_core" = "Warp Core"
  "warp_core_panel" = "Warp Core Panel"
}

$forcedCategories = @{
  "multiblock_core" = "Machines"
}

$entries = @{}
$machineKeys = [System.Collections.Generic.HashSet[string]]::new()

function Escape-Html {
  param([string]$Text)
  if ([string]::IsNullOrEmpty($Text)) { return "" }
  return [System.Net.WebUtility]::HtmlEncode($Text)
}

function Normalize-Slug {
  param([string]$Text)
  $value = $Text.ToLowerInvariant()
  $value = $value -replace "[^a-z0-9]+", "_"
  $value = $value.Trim("_")
  if ([string]::IsNullOrWhiteSpace($value)) { return "entry" }
  return $value
}

function Folder-Slug {
  param([string]$Text)
  return (Normalize-Slug $Text) -replace "_", "-"
}

function Pretty-Title {
  param([string]$Slug)

  if ($titleOverrides.ContainsKey($Slug)) {
    return $titleOverrides[$Slug]
  }

  $segments = $Slug -split "[_\-]"
  $words = foreach ($segment in $segments) {
    switch ($segment.ToLowerInvariant()) {
      "mcfr" { "MCFR"; continue }
      "stfr" { "STFR"; continue }
      "ebf" { "EBF"; continue }
      "gui" { "GUI"; continue }
      "terf" { "TERF"; continue }
      "opencore" { "OpenCore"; continue }
      "cd" { "CD"; continue }
      default {
        if ([string]::IsNullOrWhiteSpace($segment)) { continue }
        $first = $segment.Substring(0, 1).ToUpperInvariant()
        $rest = if ($segment.Length -gt 1) { $segment.Substring(1).ToLowerInvariant() } else { "" }
        "$first$rest"
      }
    }
  }

  return ($words -join " ")
}

function Get-TextValue {
  param($Value)

  if ($null -eq $Value) { return $null }
  if ($Value -is [string]) { return $Value }

  if ($Value.PSObject.Properties.Name -contains "text") {
    return [string]$Value.text
  }

  if ($Value -is [System.Collections.IEnumerable]) {
    $parts = foreach ($item in $Value) {
      $resolved = Get-TextValue $item
      if ($resolved) { $resolved }
    }
    return (($parts -join " ").Trim())
  }

  return [string]$Value
}

function Add-UniqueValue {
  param(
    [System.Collections.ArrayList]$List,
    [string]$Value
  )

  if ([string]::IsNullOrWhiteSpace($Value)) { return }
  if (-not $List.Contains($Value)) { [void]$List.Add($Value) }
}

function Ensure-Entry {
  param(
    [string]$Key,
    [string]$Title,
    [string]$Category
  )

  if (-not $entries.ContainsKey($Key)) {
    $entries[$Key] = [ordered]@{
      Key = $Key
      Slug = Folder-Slug $Key
      Title = if ($Title) { $Title } else { Pretty-Title $Key }
      PrimaryCategory = $Category
      Categories = [System.Collections.ArrayList]::new()
      SourceTypes = [System.Collections.ArrayList]::new()
      Summary = ""
      Details = [System.Collections.ArrayList]::new()
      SourceFiles = [System.Collections.ArrayList]::new()
      SourceDirs = [System.Collections.ArrayList]::new()
      Related = [System.Collections.ArrayList]::new()
    }
    Add-UniqueValue -List $entries[$Key].Categories -Value $Category
  }

  $entry = $entries[$Key]

  if ($Title -and $entry.Title -eq (Pretty-Title $Key)) {
    $entry.Title = $Title
  }

  if ($Category -and $categoryPriority[$Category] -gt $categoryPriority[$entry.PrimaryCategory]) {
    $entry.PrimaryCategory = $Category
  }

  Add-UniqueValue -List $entry.Categories -Value $Category
  return $entry
}

function Set-EntryData {
  param(
    [string]$Key,
    [string]$Title,
    [string]$Category,
    [string]$Summary,
    [string[]]$Details = @(),
    [string[]]$SourceFiles = @(),
    [string[]]$SourceDirs = @(),
    [string[]]$SourceTypes = @(),
    [string[]]$Related = @()
  )

  $entry = Ensure-Entry -Key $Key -Title $Title -Category $Category

  if ($Summary) {
    if ([string]::IsNullOrWhiteSpace($entry.Summary) -or $entry.Summary.StartsWith("Detected from ") -or $Summary.Length -gt $entry.Summary.Length) {
      $entry.Summary = $Summary
    }
  }

  foreach ($detail in $Details) { Add-UniqueValue -List $entry.Details -Value $detail }
  foreach ($path in $SourceFiles) { Add-UniqueValue -List $entry.SourceFiles -Value $path }
  foreach ($path in $SourceDirs) { Add-UniqueValue -List $entry.SourceDirs -Value $path }
  foreach ($kind in $SourceTypes) { Add-UniqueValue -List $entry.SourceTypes -Value $kind }
  foreach ($relatedKey in $Related) {
    if ($relatedKey -ne $Key) { Add-UniqueValue -List $entry.Related -Value $relatedKey }
  }
}

function Relative-RefPath {
  param([string]$FullPath)
  return $FullPath.Replace("$repoRoot\", "").Replace("\", "/")
}

function Last-IdSegment {
  param([string]$Identifier)

  if (-not $Identifier) { return $null }
  $raw = ($Identifier -split ":")[-1]
  return ($raw -split "/")[-1]
}

function Friendly-Id {
  param([string]$Identifier)
  $segment = Last-IdSegment $Identifier
  if (-not $segment) { return $null }
  return Pretty-Title $segment
}

function Join-NonEmpty {
  param([string[]]$Values)
  return (($Values | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }) -join ", ")
}

function Get-RecipeIngredientNames {
  param($Recipe)

  $names = [System.Collections.ArrayList]::new()

  if ($Recipe.PSObject.Properties.Name -contains "key") {
    foreach ($property in $Recipe.key.PSObject.Properties) {
      $ingredient = $property.Value
      if ($ingredient -is [string]) {
        Add-UniqueValue -List $names -Value (Friendly-Id $ingredient)
        continue
      }
      if ($ingredient.PSObject.Properties.Name -contains "item") {
        Add-UniqueValue -List $names -Value (Friendly-Id $ingredient.item)
      }
      if ($ingredient.PSObject.Properties.Name -contains "tag") {
        Add-UniqueValue -List $names -Value ("Tag: " + (Friendly-Id $ingredient.tag))
      }
    }
  }

  if ($Recipe.PSObject.Properties.Name -contains "ingredients") {
    foreach ($ingredient in $Recipe.ingredients) {
      if ($ingredient -is [string]) {
        Add-UniqueValue -List $names -Value (Friendly-Id $ingredient)
        continue
      }
      if ($ingredient.PSObject.Properties.Name -contains "item") {
        Add-UniqueValue -List $names -Value (Friendly-Id $ingredient.item)
      }
      if ($ingredient.PSObject.Properties.Name -contains "tag") {
        Add-UniqueValue -List $names -Value ("Tag: " + (Friendly-Id $ingredient.tag))
      }
    }
  }

  if ($Recipe.PSObject.Properties.Name -contains "ingredient") {
    $ingredient = $Recipe.ingredient
    if ($ingredient -is [string]) {
      Add-UniqueValue -List $names -Value (Friendly-Id $ingredient)
    } elseif ($ingredient.PSObject.Properties.Name -contains "item") {
      Add-UniqueValue -List $names -Value (Friendly-Id $ingredient.item)
    } elseif ($ingredient.PSObject.Properties.Name -contains "tag") {
      Add-UniqueValue -List $names -Value ("Tag: " + (Friendly-Id $ingredient.tag))
    }
  }

  return ,$names
}

function Detect-RecipeKey {
  param($Recipe, [string]$DefaultKey)

  $result = $Recipe.result
  if ($null -eq $result) { return $DefaultKey }

  if ($result.PSObject.Properties.Name -contains "components") {
    $components = $result.components
    if ($components.PSObject.Properties.Name -contains "minecraft:item_model") {
      $model = [string]$components."minecraft:item_model"
      if ($model -like "terf:*") {
        return Normalize-Slug (Last-IdSegment $model)
      }
    }
    if ($components.PSObject.Properties.Name -contains "minecraft:item_name") {
      $nameText = Get-TextValue $components."minecraft:item_name"
      if ($nameText) { return Normalize-Slug $nameText }
    }
  }

  if ($result.PSObject.Properties.Name -contains "id") {
    return Normalize-Slug (Last-IdSegment $result.id)
  }

  return $DefaultKey
}

function Recipe-TypeLabel {
  param([string]$TypeId)
  $segment = Last-IdSegment $TypeId
  if (-not $segment) { return "Recipe" }
  return Pretty-Title $segment
}

function Detail-ListHtml {
  param([System.Collections.ArrayList]$Items)

  if ($Items.Count -eq 0) {
    return "<p class=`"empty-note`">No extra source details were extracted for this entry yet.</p>"
  }

  $lines = foreach ($item in $Items) { "<li>" + (Escape-Html $item) + "</li>" }
  return "<ul class=`"detail-list`">`n$($lines -join "`n")`n</ul>"
}

function Source-ListHtml {
  param([System.Collections.ArrayList]$Items)

  if ($Items.Count -eq 0) {
    return "<p class=`"empty-note`">No direct source references recorded.</p>"
  }

  $lines = foreach ($item in $Items) { "<li><code>" + (Escape-Html $item) + "</code></li>" }
  return "<ul class=`"source-list`">`n$($lines -join "`n")`n</ul>"
}

function Badge-Html {
  param([string[]]$Values)

  if (-not $Values -or $Values.Count -eq 0) { return "" }
  return (($Values | ForEach-Object { "<span class=`"pill`">" + (Escape-Html $_) + "</span>" }) -join "")
}

function Related-LinksHtml {
  param([System.Collections.ArrayList]$RelatedKeys)

  if ($RelatedKeys.Count -eq 0) {
    return "<p class=`"empty-note`">No related pages were linked automatically yet.</p>"
  }

  $links = foreach ($relatedKey in $RelatedKeys) {
    if (-not $entries.ContainsKey($relatedKey)) { continue }
    $relatedEntry = $entries[$relatedKey]
    $folder = Folder-Slug $relatedEntry.PrimaryCategory
    $href = "../../entries/$folder/$($relatedEntry.Slug).html"
    "<a class=`"related-link`" href=`"$href`">$([System.Net.WebUtility]::HtmlEncode($relatedEntry.Title))</a>"
  }

  if (-not $links) {
    return "<p class=`"empty-note`">No related pages were linked automatically yet.</p>"
  }

  return "<div class=`"related-links`">" + ($links -join "") + "</div>"
}

$damageTags = @{}
Get-ChildItem -Path (Join-Path $refRoot "tags\damage_type") -File -ErrorAction SilentlyContinue | ForEach-Object {
  $json = Get-Content $_.FullName -Raw | ConvertFrom-Json
  foreach ($value in $json.values) {
    $key = Normalize-Slug (Last-IdSegment $value)
    if (-not $damageTags.ContainsKey($key)) {
      $damageTags[$key] = [System.Collections.ArrayList]::new()
    }
    Add-UniqueValue -List $damageTags[$key] -Value (Pretty-Title $_.BaseName)
  }
}

$machineRoot = Join-Path $refRoot "function\entity\machines"
Get-ChildItem -Path $machineRoot -Directory | ForEach-Object {
  $key = Normalize-Slug $_.Name
  [void]$machineKeys.Add($key)
  $functionCount = (Get-ChildItem -Path $_.FullName -Recurse -File).Count
  $subsystems = Get-ChildItem -Path $_.FullName -Directory | ForEach-Object { Pretty-Title $_.Name }
  $summary = "Machine logic implemented through $functionCount function file(s) under the TERF machine controller tree."
  $details = @("Function files: $functionCount")
  if ($subsystems.Count -gt 0) {
    $details += "Subsystems: " + (Join-NonEmpty $subsystems)
  }

  Set-EntryData `
    -Key $key `
    -Title (Pretty-Title $key) `
    -Category "Machines" `
    -Summary $summary `
    -Details $details `
    -SourceDirs @((Relative-RefPath $_.FullName)) `
    -SourceTypes @("Function Directory")
}

$entityConceptRoot = Join-Path $refRoot "function\entity"
$entityConceptExcludes = @("machines")
Get-ChildItem -Path $entityConceptRoot -Directory | ForEach-Object {
  if ($entityConceptExcludes -contains $_.Name) { return }

  $key = Normalize-Slug $_.Name
  $functionCount = (Get-ChildItem -Path $_.FullName -Recurse -File).Count
  $subsystems = Get-ChildItem -Path $_.FullName -Directory | ForEach-Object { Pretty-Title $_.Name }
  $summary = "Scripted TERF concept implemented through $functionCount function file(s) in the entity system."
  $details = @("Function files: $functionCount")
  if ($subsystems.Count -gt 0) {
    $details += "Subsystems: " + (Join-NonEmpty $subsystems)
  }

  Set-EntryData `
    -Key $key `
    -Title (Pretty-Title $key) `
    -Category "Concepts & Systems" `
    -Summary $summary `
    -Details $details `
    -SourceDirs @((Relative-RefPath $_.FullName)) `
    -SourceTypes @("Function Directory")
}

Get-ChildItem -Path (Join-Path $refRoot "recipe") -Recurse -File | ForEach-Object {
  $json = Get-Content $_.FullName -Raw | ConvertFrom-Json
  $defaultKey = Normalize-Slug $_.BaseName
  $key = Detect-RecipeKey -Recipe $json -DefaultKey $defaultKey
  $result = $json.result
  $itemName = $null
  $loreLines = @()
  $resultId = $null

  if ($result) {
    if ($result.PSObject.Properties.Name -contains "id") {
      $resultId = [string]$result.id
    }

    if ($result.PSObject.Properties.Name -contains "components") {
      $components = $result.components
      if ($components.PSObject.Properties.Name -contains "minecraft:item_name") {
        $itemName = Get-TextValue $components."minecraft:item_name"
      }
      if ($components.PSObject.Properties.Name -contains "minecraft:lore") {
        foreach ($line in $components."minecraft:lore") {
          $text = Get-TextValue $line
          if ($text) { $loreLines += $text }
        }
      }
    }
  }

  $title = if ($itemName) { $itemName } else { Pretty-Title $key }
  if ($loreLines.Count -gt 0) {
    $summary = (($loreLines | Select-Object -First 2) -join " ")
  } elseif ($_.DirectoryName -like "*\blasting") {
    $summary = "Process recipe entry for $title within TERF's material conversion chain."
  } else {
    $summary = "Craftable or processable TERF item/block detected from recipe data."
  }

  $ingredients = Get-RecipeIngredientNames $json
  $details = @("Recipe type: " + (Recipe-TypeLabel $json.type))
  if ($resultId) { $details += "Result id: $resultId" }
  if ($ingredients.Count -gt 0) { $details += "Inputs: " + (Join-NonEmpty $ingredients) }

  Set-EntryData `
    -Key $key `
    -Title $title `
    -Category "Items & Blocks" `
    -Summary $summary `
    -Details $details `
    -SourceFiles @((Relative-RefPath $_.FullName)) `
    -SourceTypes @("Recipe")
}

Get-ChildItem -Path (Join-Path $refRoot "advancement") -Recurse -File | ForEach-Object {
  $relative = Relative-RefPath $_.FullName
  if ($relative -like "ref/terf/advancement/internal/*") { return }

  $json = Get-Content $_.FullName -Raw | ConvertFrom-Json
  $baseKey = Normalize-Slug $_.BaseName
  $parentDir = Split-Path $_.DirectoryName -Leaf
  $parentKey = Normalize-Slug $parentDir
  $title = Get-TextValue $json.display.title
  $description = Get-TextValue $json.display.description
  $key = $baseKey
  $category = "Concepts & Systems"

  if ($machineKeys.Contains($baseKey)) {
    $category = "Machines"
  }

  if ($parentKey -and $machineKeys.Contains($parentKey) -and $baseKey -eq $parentKey) {
    $category = "Machines"
  }

  if ($description) {
    $summary = $description
  } else {
    $summary = "Advancement milestone tracked by the TERF pack."
  }

  $details = @()
  if ($json.display.icon.id) { $details += "Advancement icon: $($json.display.icon.id)" }
  if ($json.parent) { $details += "Parent advancement: $($json.parent)" }

  $related = @()
  if ($parentKey -and $machineKeys.Contains($parentKey) -and $baseKey -ne $parentKey) {
    $related += $parentKey
  }

  $resolvedTitle = if ($title) { $title } else { Pretty-Title $key }

  Set-EntryData `
    -Key $key `
    -Title $resolvedTitle `
    -Category $category `
    -Summary $summary `
    -Details $details `
    -SourceFiles @($relative) `
    -SourceTypes @("Advancement") `
    -Related $related
}

Get-ChildItem -Path (Join-Path $refRoot "damage_type") -File | ForEach-Object {
  $key = Normalize-Slug $_.BaseName
  $category = if ($machineKeys.Contains($key)) { "Machines" } else { "Hazards" }
  $properties = if ($damageTags.ContainsKey($key)) { $damageTags[$key] } else { [System.Collections.ArrayList]::new() }
  $details = @()
  if ($properties.Count -gt 0) {
    $details += "Damage properties: " + (Join-NonEmpty $properties)
  }

  Set-EntryData `
    -Key $key `
    -Title (Pretty-Title $key) `
    -Category $category `
    -Summary "Custom TERF damage source used by pack mechanics, failures, or environmental effects." `
    -Details $details `
    -SourceFiles @((Relative-RefPath $_.FullName)) `
    -SourceTypes @("Damage Type")
}

Get-ChildItem -Path (Join-Path $refRoot "dimension") -File | ForEach-Object {
  $key = Normalize-Slug $_.BaseName
  $json = Get-Content $_.FullName -Raw | ConvertFrom-Json
  $generatorType = Last-IdSegment $json.generator.type
  $biome = $json.generator.settings.biome
  $details = @()
  if ($json.type) { $details += "Dimension type: $($json.type)" }
  if ($generatorType) { $details += "Generator: " + (Pretty-Title $generatorType) }
  if ($biome) { $details += "Primary biome: $biome" }

  Set-EntryData `
    -Key $key `
    -Title (Pretty-Title $key) `
    -Category "World & Dimensions" `
    -Summary "Custom TERF dimension definition detected in the pack's world data." `
    -Details $details `
    -SourceFiles @((Relative-RefPath $_.FullName)) `
    -SourceTypes @("Dimension")
}

Get-ChildItem -Path (Join-Path $refRoot "worldgen\biome") -File | ForEach-Object {
  $key = Normalize-Slug $_.BaseName
  $json = Get-Content $_.FullName -Raw | ConvertFrom-Json
  $details = @()
  if ($null -ne $json.temperature) { $details += "Temperature: $($json.temperature)" }
  if ($null -ne $json.downfall) { $details += "Downfall: $($json.downfall)" }

  Set-EntryData `
    -Key $key `
    -Title (Pretty-Title $key) `
    -Category "World & Dimensions" `
    -Summary "Custom TERF biome definition used by the pack's dimensions or worldgen rules." `
    -Details $details `
    -SourceFiles @((Relative-RefPath $_.FullName)) `
    -SourceTypes @("Biome")
}

Get-ChildItem -Path (Join-Path $refRoot "timeline") -File | ForEach-Object {
  $key = Normalize-Slug $_.BaseName
  $json = Get-Content $_.FullName -Raw | ConvertFrom-Json
  $trackCount = if ($json.tracks) { $json.tracks.PSObject.Properties.Count } else { 0 }

  Set-EntryData `
    -Key $key `
    -Title (Pretty-Title $key) `
    -Category "World & Dimensions" `
    -Summary "Timeline definition controlling visual or temporal behavior in TERF spaces." `
    -Details @("Period ticks: $($json.period_ticks)", "Tracks: $trackCount") `
    -SourceFiles @((Relative-RefPath $_.FullName)) `
    -SourceTypes @("Timeline")
}

Get-ChildItem -Path (Join-Path $refRoot "enchantment") -File | ForEach-Object {
  $key = Normalize-Slug $_.BaseName
  Set-EntryData `
    -Key $key `
    -Title (Pretty-Title $key) `
    -Category "Concepts & Systems" `
    -Summary "Custom TERF enchantment definition." `
    -SourceFiles @((Relative-RefPath $_.FullName)) `
    -SourceTypes @("Enchantment")
}

Get-ChildItem -Path (Join-Path $refRoot "trim_pattern") -File | ForEach-Object {
  $key = Normalize-Slug $_.BaseName
  Set-EntryData `
    -Key $key `
    -Title (Pretty-Title $key) `
    -Category "Media & Cosmetics" `
    -Summary "Armor trim pattern included by the TERF pack." `
    -SourceFiles @((Relative-RefPath $_.FullName)) `
    -SourceTypes @("Trim Pattern")
}

Get-ChildItem -Path (Join-Path $refRoot "painting_variant") -File | ForEach-Object {
  $key = Normalize-Slug $_.BaseName
  Set-EntryData `
    -Key $key `
    -Title (Pretty-Title $key) `
    -Category "Media & Cosmetics" `
    -Summary "Painting variant bundled with the TERF content set." `
    -SourceFiles @((Relative-RefPath $_.FullName)) `
    -SourceTypes @("Painting")
}

Get-ChildItem -Path (Join-Path $refRoot "jukebox_song") -File | ForEach-Object {
  $key = Normalize-Slug $_.BaseName
  Set-EntryData `
    -Key $key `
    -Title (Pretty-Title $key) `
    -Category "Media & Cosmetics" `
    -Summary "Jukebox song registered by the TERF pack." `
    -SourceFiles @((Relative-RefPath $_.FullName)) `
    -SourceTypes @("Jukebox Song")
}

foreach ($entry in $entries.Values) {
  if ([string]::IsNullOrWhiteSpace($entry.Summary)) {
    $entry.Summary = "Detected from TERF pack data."
  }
}

foreach ($forcedKey in $forcedCategories.Keys) {
  if ($entries.ContainsKey($forcedKey)) {
    $entries[$forcedKey].PrimaryCategory = $forcedCategories[$forcedKey]
    Add-UniqueValue -List $entries[$forcedKey].Categories -Value $forcedCategories[$forcedKey]
  }
}

foreach ($machineKey in $machineKeys) {
  if ($entries.ContainsKey($machineKey)) {
    $entries[$machineKey].Title = Pretty-Title $machineKey
  }
}

foreach ($forcedTitleKey in $titleOverrides.Keys) {
  if ($entries.ContainsKey($forcedTitleKey)) {
    $entries[$forcedTitleKey].Title = Pretty-Title $forcedTitleKey
  }
}

foreach ($entry in $entries.Values) {
  foreach ($candidate in $entries.Keys) {
    if ($candidate -eq $entry.Key) { continue }
    if ($entry.Key.StartsWith("$candidate" + "_") -or $candidate.StartsWith("$($entry.Key)_")) {
      Add-UniqueValue -List $entry.Related -Value $candidate
    }
  }
}

$categoryFolders = @{}
foreach ($category in $categoryOrder) {
  $folder = Folder-Slug $category
  $categoryFolders[$category] = $folder
  New-Item -ItemType Directory -Force -Path (Join-Path $outputRoot $folder) | Out-Null
}

$allEntries = $entries.Values | Sort-Object Title

foreach ($entry in $allEntries) {
  $folder = $categoryFolders[$entry.PrimaryCategory]
  $target = Join-Path (Join-Path $outputRoot $folder) "$($entry.Slug).html"
  $metaBadges = Badge-Html ([string[]](@($entry.PrimaryCategory) + @($entry.SourceTypes)))
  $categoryLine = ($entry.Categories -join ", ")
  $detailHtml = Detail-ListHtml $entry.Details
  $sourceHtml = Source-ListHtml $entry.SourceFiles
  $dirHtml = Source-ListHtml $entry.SourceDirs
  $relatedHtml = Related-LinksHtml $entry.Related

  $page = @"
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>$([System.Net.WebUtility]::HtmlEncode($entry.Title)) | TERF Wiki</title>
    <meta
      name="description"
      content="$([System.Net.WebUtility]::HtmlEncode($entry.Summary))"
    />
    <link rel="stylesheet" href="../../styles.css" />
    <script src="../../theme.js" defer></script>
  </head>
  <body class="docs-body">
    <header class="topbar">
      <div class="topbar-inner">
        <a class="brand" href="../../index.html">
          <span class="brand-title">TERF Wiki</span>
          <span class="brand-subtitle">Generated pack reference</span>
        </a>
        <div class="topbar-actions">
          <a class="topbar-link" href="../../index.html">Back to Glossary</a>
          <button
            class="theme-toggle"
            type="button"
            aria-label="Toggle color theme"
            data-theme-toggle
          >
            <span data-theme-label>Dark mode</span>
          </button>
        </div>
      </div>
    </header>

    <div class="docs-layout">
      <aside class="site-sidebar">
        <p class="sidebar-title">Categories</p>
        <nav class="sidebar-nav" aria-label="Category navigation">
          <a href="../../index.html#machines">Machines</a>
          <a href="../../index.html#items-blocks">Items &amp; Blocks</a>
          <a href="../../index.html#concepts-systems">Concepts &amp; Systems</a>
          <a href="../../index.html#hazards">Hazards</a>
          <a href="../../index.html#world-dimensions">World &amp; Dimensions</a>
          <a href="../../index.html#media-cosmetics">Media &amp; Cosmetics</a>
        </nav>
      </aside>

      <main class="doc-panel">
        <nav class="breadcrumbs" aria-label="Breadcrumbs">
          <a href="../../index.html">Home</a>
          <span>/</span>
          <span>$([System.Net.WebUtility]::HtmlEncode($entry.PrimaryCategory))</span>
          <span>/</span>
          <span>$([System.Net.WebUtility]::HtmlEncode($entry.Title))</span>
        </nav>

        <h1 class="doc-title">$([System.Net.WebUtility]::HtmlEncode($entry.Title))</h1>
        <p class="doc-intro">$([System.Net.WebUtility]::HtmlEncode($entry.Summary))</p>

        <div class="meta-row">$metaBadges</div>

        <section class="doc-section">
          <h2>Overview</h2>
          <div class="info-grid">
            <article class="info-card">
              <h3>Primary Category</h3>
              <p>$([System.Net.WebUtility]::HtmlEncode($entry.PrimaryCategory))</p>
            </article>
            <article class="info-card">
              <h3>Also Tagged As</h3>
              <p>$([System.Net.WebUtility]::HtmlEncode($categoryLine))</p>
            </article>
            <article class="info-card">
              <h3>Source Types</h3>
              <p>$([System.Net.WebUtility]::HtmlEncode(($entry.SourceTypes -join ", ")))</p>
            </article>
          </div>
        </section>

        <section class="doc-section">
          <h2>Source Notes</h2>
          $detailHtml
        </section>

        <section class="doc-section">
          <h2>Source Files</h2>
          $sourceHtml
        </section>

        <section class="doc-section">
          <h2>Source Directories</h2>
          $dirHtml
        </section>
      </main>

      <aside class="page-outline">
        <p class="outline-title">Related</p>
        <p class="outline-copy">
          These links were grouped automatically from naming and registry overlap.
        </p>
        $relatedHtml
      </aside>
    </div>
  </body>
</html>
"@

  Set-Content -Path $target -Value $page -Encoding UTF8
}

$statsHtml = foreach ($category in $categoryOrder) {
  $count = ($allEntries | Where-Object { $_.PrimaryCategory -eq $category }).Count
@"
<article class="stat-card">
  <h2>$([System.Net.WebUtility]::HtmlEncode($category))</h2>
  <p class="stat-value">$count</p>
  <p>$([System.Net.WebUtility]::HtmlEncode($categoryDescriptions[$category]))</p>
</article>
"@
}

$sectionHtml = foreach ($category in $categoryOrder) {
  $entriesInCategory = $allEntries | Where-Object { $_.PrimaryCategory -eq $category }
  $categoryId = Folder-Slug $category
  $cards = foreach ($entry in $entriesInCategory) {
    $folder = $categoryFolders[$entry.PrimaryCategory]
    $href = "./entries/$folder/$($entry.Slug).html"
    $badges = Badge-Html $entry.SourceTypes
@"
<article class="catalog-card">
  <h3><a href="$href">$([System.Net.WebUtility]::HtmlEncode($entry.Title))</a></h3>
  <p>$([System.Net.WebUtility]::HtmlEncode($entry.Summary))</p>
  <div class="catalog-meta">
    <span>$([System.Net.WebUtility]::HtmlEncode($entry.PrimaryCategory))</span>
    <span>$($entry.SourceFiles.Count + $entry.SourceDirs.Count) source ref(s)</span>
  </div>
  <div class="meta-row">$badges</div>
</article>
"@
  }

@"
<section class="doc-section" id="$categoryId">
  <h2>$([System.Net.WebUtility]::HtmlEncode($category))</h2>
  <p class="section-copy">$([System.Net.WebUtility]::HtmlEncode($categoryDescriptions[$category]))</p>
  <div class="catalog-grid">
    $($cards -join "`n")
  </div>
</section>
"@
}

$indexPage = @"
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Glossary | TERF Wiki</title>
    <meta
      name="description"
      content="Generated TERF pack glossary covering machines, items, hazards, systems, and world content."
    />
    <link rel="stylesheet" href="./styles.css" />
    <script src="./theme.js" defer></script>
  </head>
  <body class="docs-body">
    <header class="topbar">
      <div class="topbar-inner">
        <a class="brand" href="./index.html">
          <span class="brand-title">TERF Wiki</span>
          <span class="brand-subtitle">Generated pack reference</span>
        </a>
        <div class="topbar-actions">
          <a class="topbar-link" href="#machines">Browse Machines</a>
          <button
            class="theme-toggle"
            type="button"
            aria-label="Toggle color theme"
            data-theme-toggle
          >
            <span data-theme-label>Dark mode</span>
          </button>
        </div>
      </div>
    </header>

    <div class="docs-layout">
      <aside class="site-sidebar">
        <p class="sidebar-title">Glossary</p>
        <nav class="sidebar-nav" aria-label="Section navigation">
          <a href="#machines">Machines</a>
          <a href="#items-blocks">Items &amp; Blocks</a>
          <a href="#concepts-systems">Concepts &amp; Systems</a>
          <a href="#hazards">Hazards</a>
          <a href="#world-dimensions">World &amp; Dimensions</a>
          <a href="#media-cosmetics">Media &amp; Cosmetics</a>
        </nav>
      </aside>

      <main class="doc-panel">
        <nav class="breadcrumbs" aria-label="Breadcrumbs">
          <span>Home</span>
          <span>/</span>
          <span>Glossary</span>
        </nav>

        <h1 class="doc-title">Glossary</h1>
        <p class="doc-intro">
          This glossary was generated from the custom TERF namespace inside <code>ref/terf</code>. It organizes the pack into machine pages, item/block pages, hazards, world entries, and broader gameplay concepts so the reference can keep growing from the source data instead of hand-maintained lists.
        </p>

        <p class="callout">
          Scope note: this pass documents TERF-specific content and ignores the copied vanilla/support namespaces unless they directly inform TERF pages.
        </p>

        <section class="doc-section">
          <h2>Pack Snapshot</h2>
          <div class="stat-grid">
            $($statsHtml -join "`n")
          </div>
        </section>

        $($sectionHtml -join "`n")
      </main>

      <aside class="page-outline">
        <p class="outline-title">Source</p>
        <p class="outline-copy">
          Generated from <code>ref/terf</code> using recipes, advancements, dimensions, timelines, damage types, machine function trees, and media registries.
        </p>
      </aside>
    </div>
  </body>
</html>
"@

Set-Content -Path (Join-Path $repoRoot "index.html") -Value $indexPage -Encoding UTF8

$inventory = $allEntries | ForEach-Object {
  [ordered]@{
    title = $_.Title
    slug = $_.Slug
    key = $_.Key
    primaryCategory = $_.PrimaryCategory
    categories = $_.Categories
    sourceTypes = $_.SourceTypes
    summary = $_.Summary
    sourceFiles = $_.SourceFiles
    sourceDirs = $_.SourceDirs
    related = $_.Related
  }
}

$inventory | ConvertTo-Json -Depth 6 | Set-Content -Path (Join-Path $repoRoot "catalog.json") -Encoding UTF8

Write-Host "Generated $($allEntries.Count) TERF wiki page(s)."
