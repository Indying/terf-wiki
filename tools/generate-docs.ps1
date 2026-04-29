$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$refRoot = Join-Path $repoRoot "ref\terf"
$entriesRoot = Join-Path $repoRoot "entries"
$groupsRoot = Join-Path $repoRoot "groups"

if (-not (Test-Path $refRoot)) {
  throw "Expected TERF reference data at $refRoot"
}

New-Item -ItemType Directory -Force -Path $entriesRoot, $groupsRoot | Out-Null
Get-ChildItem -Path $entriesRoot -Recurse -File -Filter *.html -ErrorAction SilentlyContinue | Remove-Item -Force
Get-ChildItem -Path $groupsRoot -Recurse -File -Filter *.html -ErrorAction SilentlyContinue | Remove-Item -Force

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
  "Machines" = "Operational machinery and multiblock systems discovered in TERF's machine logic tree."
  "Items & Blocks" = "Craftable components, industrial blocks, utilities, and custom recipe outputs surfaced through TERF recipes."
  "Concepts & Systems" = "Pack mechanics, scripted entities, progression hooks, and simulation systems that drive TERF behavior."
  "Hazards" = "Custom damage sources, dangerous environments, and failure conditions."
  "World & Dimensions" = "Dimensions, biomes, and timeline definitions that shape TERF's spaces."
  "Media & Cosmetics" = "Music, paintings, and trim patterns included by the pack."
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

$subgroupDefinitions = @{
  "Machines" = @(
    [ordered]@{ Slug = "power-generation"; Title = "Power Generation"; Description = "Engines, turbines, solar systems, and electrical supply hardware." }
    [ordered]@{ Slug = "resource-gathering"; Title = "Resource Gathering"; Description = "Extraction, collection, and field automation machines." }
    [ordered]@{ Slug = "resource-refining"; Title = "Resource Refining"; Description = "Industrial processing, separation, and material treatment machines." }
    [ordered]@{ Slug = "crafting-devices"; Title = "Crafting Devices"; Description = "Machines focused on fabrication, assembly, and item conversion." }
    [ordered]@{ Slug = "logistics-storage"; Title = "Logistics & Storage"; Description = "Movement, transfer, storage, and passive infrastructure machines." }
    [ordered]@{ Slug = "control-security-networking"; Title = "Control, Security & Networking"; Description = "Monitoring, security, switching, and control-oriented machines." }
    [ordered]@{ Slug = "reactor-exotic-systems"; Title = "Reactor & Exotic Systems"; Description = "Multiblocks, collider-scale devices, reactors, and other exotic machinery." }
  )
  "Items & Blocks" = @(
    [ordered]@{ Slug = "machine-reactor-components"; Title = "Machine & Reactor Components"; Description = "Specialized parts used to build or support TERF machinery." }
    [ordered]@{ Slug = "power-data-automation-parts"; Title = "Power, Data & Automation Parts"; Description = "Wiring, display, and transport-adjacent recipe outputs." }
    [ordered]@{ Slug = "structural-facility-blocks"; Title = "Structural & Facility Blocks"; Description = "Industrial building materials and facility-facing construction pieces." }
    [ordered]@{ Slug = "processed-materials"; Title = "Processed Materials"; Description = "Converted materials and recipe-derived industrial outputs." }
    [ordered]@{ Slug = "utility-items-consumables"; Title = "Utility Items & Consumables"; Description = "Helper items, one-off tools, and consumable outputs." }
    [ordered]@{ Slug = "cosmetic-recipes"; Title = "Cosmetic Recipes"; Description = "Recipe-driven cosmetic unlocks and trim-related items." }
  )
  "Concepts & Systems" = @(
    [ordered]@{ Slug = "core-systems"; Title = "Core Systems"; Description = "Foundational TERF systems, pack rules, and headline mechanics." }
    [ordered]@{ Slug = "event-failure-chains"; Title = "Event & Failure Chains"; Description = "State changes, startup flows, and catastrophic progression hooks." }
    [ordered]@{ Slug = "entity-projectile-systems"; Title = "Entity & Projectile Systems"; Description = "Spawned effects, projectiles, anomaly objects, and mobile threats." }
    [ordered]@{ Slug = "player-interaction-systems"; Title = "Player & Interaction Systems"; Description = "Interaction logic, player-facing checks, and triggered behaviors." }
    [ordered]@{ Slug = "environmental-simulation-systems"; Title = "Environmental & Simulation Systems"; Description = "Ambient systems, environmental logic, and utility simulation behaviors." }
  )
  "Hazards" = @(
    [ordered]@{ Slug = "reactor-radiation"; Title = "Reactor & Radiation"; Description = "Radiation, reactor-related harm, and energy overload damage sources." }
    [ordered]@{ Slug = "security-enforcement"; Title = "Security & Enforcement"; Description = "Automated defensive systems and enforcement-style damage sources." }
    [ordered]@{ Slug = "space-environmental"; Title = "Space & Environmental"; Description = "Hazards caused by vacuum, atmospheric failure, or hostile conditions." }
    [ordered]@{ Slug = "weapons-shockwaves"; Title = "Weapons & Shockwaves"; Description = "Ballistic, beam, antimatter, and shockwave-oriented damage types." }
  )
  "World & Dimensions" = @(
    [ordered]@{ Slug = "orbital-spaces"; Title = "Orbital Spaces"; Description = "Space-facing dimensions and orbital locations." }
    [ordered]@{ Slug = "waste-distortion-zones"; Title = "Waste & Distortion Zones"; Description = "Wasteland and anomaly biomes with hostile environmental identity." }
    [ordered]@{ Slug = "support-dimensions"; Title = "Support Dimensions"; Description = "Technical or utility spaces used by the pack." }
    [ordered]@{ Slug = "timelines"; Title = "Timelines"; Description = "Timeline definitions that drive sky and temporal behavior." }
  )
  "Media & Cosmetics" = @(
    [ordered]@{ Slug = "jukebox-tracks"; Title = "Jukebox Tracks"; Description = "Custom music available through the pack." }
    [ordered]@{ Slug = "paintings"; Title = "Paintings"; Description = "Custom decorative painting variants." }
    [ordered]@{ Slug = "armor-trims"; Title = "Armor Trims"; Description = "Custom trim patterns and related cosmetic materials." }
  )
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
      SubgroupSlug = ""
      SubgroupTitle = ""
      SubgroupDescription = ""
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
    if (
      [string]::IsNullOrWhiteSpace($entry.Summary) -or
      $entry.Summary.StartsWith("Detected from ") -or
      $Summary.Length -gt $entry.Summary.Length
    ) {
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
      if ($nameText) {
        return Normalize-Slug $nameText
      }
    }
  }

  if ($DefaultKey -match "^(.*)_from_[a-z0-9_]+$") {
    return Normalize-Slug $Matches[1]
  }

  if ($result.PSObject.Properties.Name -contains "id") {
    $resultId = [string]$result.id
    if ($resultId -like "terf:*") {
      return Normalize-Slug (Last-IdSegment $resultId)
    }
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

  $lines = foreach ($item in $Items) {
    "<li>" + (Escape-Html $item) + "</li>"
  }

  return "<ul class=`"detail-list`">`n$($lines -join "`n")`n</ul>"
}

function Source-ListHtml {
  param([System.Collections.ArrayList]$Items)

  if ($Items.Count -eq 0) {
    return "<p class=`"empty-note`">No direct source references recorded.</p>"
  }

  $lines = foreach ($item in $Items) {
    "<li><code>" + (Escape-Html $item) + "</code></li>"
  }

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

function Get-SubgroupDefinition {
  param(
    [string]$Category,
    [string]$Slug
  )

  foreach ($definition in $subgroupDefinitions[$Category]) {
    if ($definition.Slug -eq $Slug) {
      return $definition
    }
  }

  return $subgroupDefinitions[$Category][-1]
}

function Get-GroupLinkCardsHtml {
  param(
    [string]$Category,
    [string]$RelativePrefix
  )

  $categoryFolder = Folder-Slug $Category
  $cards = foreach ($definition in $subgroupDefinitions[$Category]) {
    $matches = $allEntries | Where-Object {
      $_.PrimaryCategory -eq $Category -and $_.SubgroupSlug -eq $definition.Slug
    }

    if ($matches.Count -eq 0) { continue }

    $href = "$RelativePrefix/groups/$categoryFolder/$($definition.Slug).html"
@"
<a class="group-link-card" href="$href">
  <strong>$([System.Net.WebUtility]::HtmlEncode($definition.Title))</strong>
  <span class="group-link-meta">$($matches.Count) entries</span>
  <p>$([System.Net.WebUtility]::HtmlEncode($definition.Description))</p>
</a>
"@
  }

  if (-not $cards) {
    return "<p class=`"empty-note`">No subgroup pages were generated for this category.</p>"
  }

  return $cards -join "`n"
}

function Get-CategorySidebarHtml {
  param(
    [string]$Category,
    [string]$ActiveSlug,
    [string]$HrefPrefix
  )

  $links = foreach ($definition in $subgroupDefinitions[$Category]) {
    $matches = $allEntries | Where-Object {
      $_.PrimaryCategory -eq $Category -and $_.SubgroupSlug -eq $definition.Slug
    }

    if ($matches.Count -eq 0) { continue }

    $classAttr = if ($definition.Slug -eq $ActiveSlug) { ' class="is-active"' } else { "" }
    $href = "$HrefPrefix$($definition.Slug).html"
    "<a$classAttr href=`"$href`">$([System.Net.WebUtility]::HtmlEncode($definition.Title))</a>"
  }

  if (-not $links) {
    return "<p class=`"empty-note`">No sibling subgroups were available.</p>"
  }

  return $links -join "`n"
}

function Get-EntryCardHtml {
  param(
    $Entry,
    [string]$RelativePrefix
  )

  $folder = Folder-Slug $Entry.PrimaryCategory
  $href = "$RelativePrefix/entries/$folder/$($Entry.Slug).html"
  $badges = Badge-Html $Entry.SourceTypes

@"
<article class="catalog-card">
  <h3><a href="$href">$([System.Net.WebUtility]::HtmlEncode($Entry.Title))</a></h3>
  <p>$([System.Net.WebUtility]::HtmlEncode($Entry.Summary))</p>
  <div class="catalog-meta">
    <span>$([System.Net.WebUtility]::HtmlEncode($Entry.PrimaryCategory))</span>
    <span>$([System.Net.WebUtility]::HtmlEncode($Entry.SubgroupTitle))</span>
  </div>
  <div class="meta-row">$badges</div>
</article>
"@
}

function Resolve-SubgroupSlug {
  param($Entry)

  $key = $Entry.Key

  switch ($Entry.PrimaryCategory) {
    "Machines" {
      if (@("battery_array","diesel_generator","solar_panel","steam_engine","turbine_large","turbine_medium","variable_resistor") -contains $key) { return "power-generation" }
      if (@("block_breaker","block_placer","chunk_loader","crane","fluid_pump","magma_drill","ore_drill") -contains $key) { return "resource-gathering" }
      if (@("arc_furnace","breakers","crusher","deuterium_concentrator","ebf","electric_press","electrolyzer","extrusion_press","large_fluid_solidifier","pressurizer","purifier","rolling_mill","shearing_press","wet_mill") -contains $key) { return "resource-refining" }
      if (@("assembler","charging_station","fabricator") -contains $key) { return "crafting-devices" }
      if (@("capsule_interface","chimney","conveyor","fluid_tank","gear_elevator","multi_piston") -contains $key) { return "logistics-storage" }
      if (@("dev_block","lamp_controller","mainframe","redstone_probe","security_terminal","security_turret") -contains $key) { return "control-security-networking" }
      return "reactor-exotic-systems"
    }
    "Items & Blocks" {
      if (@("control_rod_assembly","copper_coil","copper_coil_stairs","dark_prismarine_bit","hex_plate","loom_mainframe_server","metal_plating") -contains $key) { return "machine-reactor-components" }
      if (@("data_cable","entity_conveyor","hanging_screen","high_voltage_conductor_slab","high_voltage_conductor_stairs","high_voltage_conductor_wall","high_voltage_wire","screen") -contains $key) { return "power-data-automation-parts" }
      if (@("black_dye","charcoal","glow_ink_sac","ink_sac","melon_slice","quartz","red_sand") -contains $key) { return "processed-materials" }
      if (@("hazmat_armor_trim","magnetic_armor_trim") -contains $key) { return "cosmetic-recipes" }
      if (@("mullermilch") -contains $key) { return "utility-items-consumables" }
      return "structural-facility-blocks"
    }
    "Concepts & Systems" {
      if (@("antimatter_explosion","forbidden_microwave","mcfr_meltdown","mcfr_startup","opencore_complete","opencore_failure","opencore_startup","quick_thinking","reaction_loss","second_chance","shutdown_failure","shutdown_failure_restab","stfr_meltdown","stfr_shutdown","stfr_startup","stfr_startup_failure") -contains $key) { return "event-failure-chains" }
      if (@("black_hole","ender_pearl","explosion","kilonova","meteor","missile","neutron","nuke","orbital_strike","photon_ball","vehicle") -contains $key) { return "entity-projectile-systems" }
      if (@("ant_man","break_turret","custom_button","player","stone_plate") -contains $key) { return "player-interaction-systems" }
      if (@("fallout","gases","limbo","particle","receptacle","sculk_charge") -contains $key) { return "environmental-simulation-systems" }
      return "core-systems"
    }
    "Hazards" {
      if (@("high_voltage","nuclear_shockwave","radiation","reactor") -contains $key) { return "reactor-radiation" }
      if (@("ban_hammer","security_drone","security_railgun","security_turret") -contains $key) { return "security-enforcement" }
      if (@("bleeding","depressurization","no_oxygen","warp_field") -contains $key) { return "space-environmental" }
      return "weapons-shockwaves"
    }
    "World & Dimensions" {
      if (@("orbit_earth","orbit_end") -contains $key) { return "orbital-spaces" }
      if (@("nuclear_wasteland","sculk_wasteland","warp_interdimensional") -contains $key) { return "waste-distortion-zones" }
      if (@("moon","space") -contains $key) { return "timelines" }
      return "support-dimensions"
    }
    "Media & Cosmetics" {
      if ($Entry.SourceTypes -contains "Jukebox Song") { return "jukebox-tracks" }
      if ($Entry.SourceTypes -contains "Painting") { return "paintings" }
      return "armor-trims"
    }
    default {
      return $subgroupDefinitions[$Entry.PrimaryCategory][0].Slug
    }
  }
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
Get-ChildItem -Path $entityConceptRoot -Directory | ForEach-Object {
  if ($_.Name -eq "machines") { return }

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
  $category = "Concepts & Systems"

  if ($machineKeys.Contains($baseKey)) {
    $category = "Machines"
  }

  if ($parentKey -and $machineKeys.Contains($parentKey) -and $baseKey -eq $parentKey) {
    $category = "Machines"
  }

  $summary = if ($description) { $description } else { "Advancement milestone tracked by the TERF pack." }
  $details = @()
  if ($json.display.icon.id) { $details += "Advancement icon: $($json.display.icon.id)" }
  if ($json.parent) { $details += "Parent advancement: $($json.parent)" }

  $related = @()
  if ($parentKey -and $machineKeys.Contains($parentKey) -and $baseKey -ne $parentKey) {
    $related += $parentKey
  }

  $resolvedTitle = if ($title) { $title } else { Pretty-Title $baseKey }

  Set-EntryData `
    -Key $baseKey `
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
  $details = @()

  if ($damageTags.ContainsKey($key) -and $damageTags[$key].Count -gt 0) {
    $details += "Damage properties: " + (Join-NonEmpty $damageTags[$key])
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
  $details = @()
  $generatorType = Last-IdSegment $json.generator.type
  $biome = $json.generator.settings.biome

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

foreach ($entry in $entries.Values) {
  $subgroupSlug = Resolve-SubgroupSlug $entry
  $subgroup = Get-SubgroupDefinition -Category $entry.PrimaryCategory -Slug $subgroupSlug
  $entry.SubgroupSlug = $subgroup.Slug
  $entry.SubgroupTitle = $subgroup.Title
  $entry.SubgroupDescription = $subgroup.Description
}

$categoryFolders = @{}
foreach ($category in $categoryOrder) {
  $folder = Folder-Slug $category
  $categoryFolders[$category] = $folder
  New-Item -ItemType Directory -Force -Path (Join-Path $entriesRoot $folder) | Out-Null
  New-Item -ItemType Directory -Force -Path (Join-Path $groupsRoot $folder) | Out-Null
}

$allEntries = $entries.Values | Sort-Object Title

foreach ($definitionCategory in $categoryOrder) {
  $categoryFolder = $categoryFolders[$definitionCategory]

  foreach ($definition in $subgroupDefinitions[$definitionCategory]) {
    $groupEntries = $allEntries | Where-Object {
      $_.PrimaryCategory -eq $definitionCategory -and $_.SubgroupSlug -eq $definition.Slug
    }

    if ($groupEntries.Count -eq 0) { continue }

    $cards = foreach ($entry in $groupEntries) {
      Get-EntryCardHtml -Entry $entry -RelativePrefix "../.."
    }

    $siblingNav = Get-CategorySidebarHtml -Category $definitionCategory -ActiveSlug $definition.Slug -HrefPrefix "./"
    $glossaryHref = "../../index.html#$categoryFolder"

    $groupPage = @"
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>$([System.Net.WebUtility]::HtmlEncode($definition.Title)) | $([System.Net.WebUtility]::HtmlEncode($definitionCategory)) | TERF Wiki</title>
    <meta
      name="description"
      content="$([System.Net.WebUtility]::HtmlEncode($definition.Description))"
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
          <a class="topbar-link" href="$glossaryHref">Back to Glossary</a>
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
        <p class="sidebar-title">$([System.Net.WebUtility]::HtmlEncode($definitionCategory))</p>
        <nav class="sidebar-nav" aria-label="Subgroup navigation">
          $siblingNav
        </nav>
      </aside>

      <main class="doc-panel">
        <nav class="breadcrumbs" aria-label="Breadcrumbs">
          <a href="../../index.html">Home</a>
          <span>/</span>
          <a href="$glossaryHref">$([System.Net.WebUtility]::HtmlEncode($definitionCategory))</a>
          <span>/</span>
          <span>$([System.Net.WebUtility]::HtmlEncode($definition.Title))</span>
        </nav>

        <h1 class="doc-title">$([System.Net.WebUtility]::HtmlEncode($definition.Title))</h1>
        <p class="doc-intro">$([System.Net.WebUtility]::HtmlEncode($definition.Description))</p>
        <div class="meta-row">
          <span class="pill">$([System.Net.WebUtility]::HtmlEncode($definitionCategory))</span>
          <span class="pill">$($groupEntries.Count) entries</span>
        </div>

        <section class="doc-section">
          <h2>Entries</h2>
          <div class="catalog-grid">
            $($cards -join "`n")
          </div>
        </section>
      </main>

      <aside class="page-outline">
        <p class="outline-title">Glossary Group</p>
        <p class="outline-copy">
          This subgroup contains $($groupEntries.Count) generated entry page(s) inside the $([System.Net.WebUtility]::HtmlEncode($definitionCategory)) category.
        </p>
        <a class="related-link" href="$glossaryHref">Open $([System.Net.WebUtility]::HtmlEncode($definitionCategory)) in the glossary</a>
      </aside>
    </div>
  </body>
</html>
"@

    Set-Content -Path (Join-Path (Join-Path $groupsRoot $categoryFolder) "$($definition.Slug).html") -Value $groupPage -Encoding UTF8
  }
}

foreach ($entry in $allEntries) {
  $folder = $categoryFolders[$entry.PrimaryCategory]
  $target = Join-Path (Join-Path $entriesRoot $folder) "$($entry.Slug).html"
  $metaBadges = Badge-Html ([string[]](@($entry.PrimaryCategory, $entry.SubgroupTitle) + @($entry.SourceTypes)))
  $categoryLine = ($entry.Categories -join ", ")
  $detailHtml = Detail-ListHtml $entry.Details
  $sourceHtml = Source-ListHtml $entry.SourceFiles
  $dirHtml = Source-ListHtml $entry.SourceDirs
  $relatedHtml = Related-LinksHtml $entry.Related
  $subgroupHref = "../../groups/$folder/$($entry.SubgroupSlug).html"
  $glossaryHref = "../../index.html#$folder"
  $siblingNav = Get-CategorySidebarHtml -Category $entry.PrimaryCategory -ActiveSlug $entry.SubgroupSlug -HrefPrefix "../../groups/$folder/"

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
          <a class="topbar-link" href="$subgroupHref">Back to $([System.Net.WebUtility]::HtmlEncode($entry.SubgroupTitle))</a>
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
        <p class="sidebar-title">$([System.Net.WebUtility]::HtmlEncode($entry.PrimaryCategory))</p>
        <nav class="sidebar-nav" aria-label="Subgroup navigation">
          $siblingNav
        </nav>
      </aside>

      <main class="doc-panel">
        <nav class="breadcrumbs" aria-label="Breadcrumbs">
          <a href="../../index.html">Home</a>
          <span>/</span>
          <a href="$glossaryHref">$([System.Net.WebUtility]::HtmlEncode($entry.PrimaryCategory))</a>
          <span>/</span>
          <a href="$subgroupHref">$([System.Net.WebUtility]::HtmlEncode($entry.SubgroupTitle))</a>
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
              <h3>Subgroup</h3>
              <p>$([System.Net.WebUtility]::HtmlEncode($entry.SubgroupTitle))</p>
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
          This page sits inside $([System.Net.WebUtility]::HtmlEncode($entry.SubgroupTitle)) and links nearby entries when naming overlap suggested a relationship.
        </p>
        $relatedHtml
      </aside>
    </div>
  </body>
</html>
"@

  Set-Content -Path $target -Value $page -Encoding UTF8
}

$glossaryGroupsHtml = foreach ($category in $categoryOrder) {
  $categoryFolder = $categoryFolders[$category]
  $categoryEntries = $allEntries | Where-Object { $_.PrimaryCategory -eq $category }
  $groupCards = Get-GroupLinkCardsHtml -Category $category -RelativePrefix "."
  $groupCount = 0
  foreach ($definition in $subgroupDefinitions[$category]) {
    $matches = $allEntries | Where-Object {
      $_.PrimaryCategory -eq $category -and $_.SubgroupSlug -eq $definition.Slug
    }
    if ($matches.Count -gt 0) { $groupCount++ }
  }
  $openAttribute = if ($category -eq $categoryOrder[0]) { " open" } else { "" }

@"
<details class="glossary-group" id="$categoryFolder"$openAttribute>
  <summary class="glossary-summary">
    <span class="glossary-title">$([System.Net.WebUtility]::HtmlEncode($category))</span>
    <span class="summary-count">$($categoryEntries.Count) entries across $groupCount group(s)</span>
  </summary>
  <p class="section-copy">$([System.Net.WebUtility]::HtmlEncode($categoryDescriptions[$category]))</p>
  <div class="glossary-links">
    $groupCards
  </div>
</details>
"@
}

$totalSubgroups = 0
foreach ($category in $categoryOrder) {
  foreach ($definition in $subgroupDefinitions[$category]) {
    $matches = $allEntries | Where-Object {
      $_.PrimaryCategory -eq $category -and $_.SubgroupSlug -eq $definition.Slug
    }
    if ($matches.Count -gt 0) { $totalSubgroups++ }
  }
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
      content="Generated TERF pack glossary grouped into broad categories and smaller subgroup pages."
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
        <nav class="sidebar-nav" aria-label="Category navigation">
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
          This glossary is now intentionally lightweight. Each broad category opens into a short list of subgroup pages, and the heavy entry listings live one level deeper so the main page stays fast.
        </p>

        <div class="meta-row">
          <span class="pill">$($allEntries.Count) generated entry pages</span>
          <span class="pill">$totalSubgroups subgroup pages</span>
          <span class="pill">Source: <code>ref/terf</code></span>
        </div>

        <p class="callout">
          Scope note: this pass documents TERF-specific content and keeps the root glossary focused on navigation instead of rendering every entry at once.
        </p>

        <section class="doc-section">
          <h2>Browse By Category</h2>
          <div class="glossary-stack">
            $($glossaryGroupsHtml -join "`n")
          </div>
        </section>
      </main>

      <aside class="page-outline">
        <p class="outline-title">Source</p>
        <p class="outline-copy">
          Generated from <code>ref/terf</code> using machine function trees, recipes, advancements, dimensions, biomes, timelines, damage types, and media registries.
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
    subgroupSlug = $_.SubgroupSlug
    subgroupTitle = $_.SubgroupTitle
    categories = $_.Categories
    sourceTypes = $_.SourceTypes
    summary = $_.Summary
    sourceFiles = $_.SourceFiles
    sourceDirs = $_.SourceDirs
    related = $_.Related
  }
}

$inventory | ConvertTo-Json -Depth 6 | Set-Content -Path (Join-Path $repoRoot "catalog.json") -Encoding UTF8

Write-Host "Generated $($allEntries.Count) TERF wiki page(s) and $totalSubgroups subgroup page(s)."
