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
$customEntryDocs = @{
  "fission_sensor" = [ordered]@{
    Summary = "Sensor head that scans nearby fuel rods and neutrons, then feeds aggregate reactor statistics to linked panels."
    Description = @(
      "The Fission Sensor is a lightweight read head for the fission system. It does not run the reactor itself; instead it looks for nearby terf_fuel_rod and terf_neutron markers and pushes aggregate numbers into shared scoreboard slots.",
      "A linked Fission Reactor Panel reads those shared values to display temperature, neutron flux, and average neutron speed. The sensor also uses sentinel values so the panel can distinguish between 'no sensor linked' and 'sensor linked but no rods detected.'"
    )
    Values = @(
      "Local machine state: no persistent machine-local terf_data_* values were documented in the scanned sensor files.",
      "Nearby fuel rod terf_data_A: rod temperature. get_data.mcfunction compares each nearby rod against max_temp and also adds the same value into average_temp.",
      "Nearby neutron data.terf.nSpeed: neutron speed. The sensor reads it with a 1000 scale factor before adding it into average_neutron_speed.",
      "Global scratch score fuel_rod_count: number of nearby rod markers included in the scan.",
      "Global scratch score neutron_flux: number of nearby neutron markers included in the scan.",
      "Global scratch score average_temp: running sum of rod temperatures before the linked panel divides it by fuel_rod_count.",
      "Global scratch score average_neutron_speed: running sum of scaled neutron speeds before the linked panel divides it by neutron_flux.",
      "Global scratch score max_temp: highest rod temperature seen in the current scan. -69420 is the untouched default and -420 is the fallback written when the sensor exists but no rod data was found."
    )
    Calculations = @(
      "Average rod temperature = sum(rod terf_data_A) / fuel_rod_count.",
      "Average neutron speed = sum(neutron nSpeed * 1000) / neutron_flux.",
      "The sensor itself only accumulates totals. The division step happens later in fission_reactor_panel/tick.mcfunction."
    )
  }
  "mcfr" = [ordered]@{
    Summary = "Temperature-driven reactor that converts fuel and coolant into pressure, steam, waste, and eventually catastrophic overpressure."
    Description = @(
      "MCFR is a continuous reactor simulation with persistent temperature, fluid storage, ignition, waste production, and overpressure behavior. Its main tick reads coolant, steam, fuel, and waste amounts from the machine fluid array and runs a reaction only after the core reaches ignition temperature.",
      "The reactor spends most of its logic budget on three loops: building pressure from hot fuel and waste, boiling coolant into steam to pull heat back out, and converting consumed fuel into waste through buffered integer math."
    )
    Values = @(
      "terf_data_A: reactor temperature with *10000 precision.",
      "terf_data_B: reactor height. Height is reused as a divisor in pressure, cooling, and fuel-usage logic.",
      "terf_data_C: waste currently stuck inside the catalyst instead of the output fluid buffer.",
      "terf_data_D: fuel-per-waste ratio. Positive values buffer waste production; negative values directly pull catalyst waste back down.",
      "terf_data_E: waste buffer used before whole waste units are added into terf_data_C.",
      "terf_data_F: fuel buffer used before whole fuel units are removed from the fuel tank.",
      "terf_data_G: ignition temperature threshold. The heavy reaction path only runs when terf_data_A >= terf_data_G.",
      "terf_data_H: power-output scalar that multiplies reaction rate and also affects fuel usage.",
      "datapipes_lib_power_max: initialized to 10000 in setup.",
      "Fluid slot 0: water, max 100000.",
      "Fluid slot 1: terf.high_pressure_steam, max 200000.",
      "Fluid slot 2: terf.hydrogen, max 100000 and stores the divided core temperature as an extra temperature field.",
      "Fluid slot 3: waste / byproduct output, max 100000."
    )
    Calculations = @(
      "Passive heat dissipation removes 100 temperature units per tick whenever terf_data_A >= 100.",
      "Displayed core temperature = terf_data_A / 10000.",
      "Pressure = (fuel_amount + waste_amount + terf_data_C) / terf_data_B * core_temp_divided.",
      "Cooling rate starts as core_temp_divided / 10, then multiplies by core_temp_divided, divides by 100, multiplies by coolant amount, and divides by mcfr_cooling_rate_divider.",
      "Steam production uses buffered integer math: cooling_rate * 40 is added to steam, then the same rate is divided back down and removed from coolant.",
      "Temperature cooling applied to the core = cooling_rate * mcfr_cooling_multiplier / terf_data_B.",
      "Reaction rate = ((fuel_amount / terf_data_B) * (core_temp_divided - ignition_temp_divided) / 200 * terf_data_H) / 5600.",
      "The resulting reaction rate is added directly into terf_data_A, so hotter fuel increases future pressure and cooling demand.",
      "Fuel usage buffer: fuel_usage = reaction_rate * terf_data_B, fuel_usage_divider = terf_data_H * mcfr_fuel_usage_divider, fuel_used = terf_data_F / fuel_usage_divider.",
      "Positive terf_data_D values route produced waste through terf_data_E and only add whole units into terf_data_C. Negative terf_data_D values directly subtract from terf_data_C.",
      "Visual overpressure effects start at pressure >= 10000000. Full reactor detonation starts at pressure >= 25000000."
    )
  }
  "stfr_control_panel" = [ordered]@{
    Summary = "Control desk for the STFR that mirrors core state, exposes manual setpoints, and arms emergency actions."
    Description = @(
      "The STFR Control Panel is a front-end machine rather than a second reactor. Its job is to mirror linked-core values onto signs, let the operator step setpoints up or down, and fire state-specific functions such as startup confirmation, shutdown, power-surge priming, and restabilization.",
      "Most of the important numbers on this page are values that live on the linked STFR core. The panel reads them, displays them, and in a few cases writes them back in +1 or -1 steps."
    )
    Values = @(
      "terf_data_A: linked reactor status. The panel checks this before allowing startup, shutdown, restabilization, or self-destruct related actions.",
      "terf_data_E: linked reactor event timer. Used for startup-complete checks and shutdown-failure recovery windows.",
      "terf_data_F: stabilizer offset control. Button files clamp it inside -99..99.",
      "terf_data_G: stabilizer input control. In the core math this ultimately feeds shield behavior. Button files clamp it inside 0..99.",
      "terf_data_H: power laser setpoint. Button files clamp it inside 0..99.",
      "terf_data_I: pressure vent setpoint. Button files clamp it inside 0..99.",
      "terf_data_J: fuel injection setpoint. Button files clamp it inside 0..99.",
      "terf_data_K: RF suppression setpoint on this controller revision. Button files clamp it inside 0..89.",
      "terf_data_U: power-surge state / timer. The panel primes, confirms, or aborts surge logic based on this value.",
      "terf_data_Ab: event logistics flag used during shutdown-failure recovery.",
      "terf_data_Ad: capacitor charge. Manual power-surge priming requires at least 950000 charge.",
      "Tag terf_key_on: reactor key switch state.",
      "Tag terf_sstb_on: shutdown/startup permissive state.",
      "Tag terf_broadcaston: whether the panel allows broadcast messages.",
      "Tag terf_case_shield_primed: operator armed the case-shield control.",
      "Tag terf_power_surge_pressed: momentary edge detector for the power-surge button."
    )
    Calculations = @(
      "Each adjustment button changes its target value by exactly 1 and then runs turn_off_stone_button to reset the observer/button stack.",
      "terf_data_F is the only exposed bipolar setpoint on this panel and is clamped to -99..99. The other continuous controls are clamped to positive ranges.",
      "Normal startup path requires terf_data_A = 0, the key switch on, the SSTB on, and later working_stabs >= 1 before the panel calls startup_confirmed/confirm_startup.",
      "Normal shutdown is only allowed while online and only when shield stress is low enough: ..19 in standard mode or ..7 in hardcore mode.",
      "Manual power surge can only be primed while online, with the surge state idle, the physical button active, and capacitor charge at 950000 or above."
    )
  }
  "fission_reactor" = [ordered]@{
    Summary = "Fuel-rod and neutron logic for the fission system, including heat spread, decay spread, steam generation, and core failure."
    Description = @(
      "The Fission Reactor files in this pack model individual fuel-rod markers rather than a single large controller score set. Each rod tracks its own temperature and decay, exchanges heat with neighbors, and spawns neutrons when fuel is still present.",
      "The logic is deliberately local: rods look at adjacent rod markers, the block above them, and nearby neutrons. This makes temperature and decay propagate through the rod network over time instead of jumping instantly across the whole structure."
    )
    Values = @(
      "terf_data_A: rod temperature.",
      "terf_data_B: rod decay.",
      "terf_data_C: maximum decay. If it is unset, the rod loads data.terf.fuel.max_decay into this score.",
      "Tag terf_radioactive: added when the rod sits on light_blue_glazed_terracotta.",
      "Nearby terf_neutron markers: if one already exists within 0.25, the rod does not spawn another burst that tick."
    )
    Calculations = @(
      "Explosion threshold: if terf_data_A >= 1000 and the rod has not already exploded, the rod runs explode_core.",
      "Passive air cooling: if the block above is air and the rod is above 0, temperature drops by 1.",
      "Water cooling: temp = floor(terf_data_A / 25) + 2, clamped to 20. If the block above is water and the rod temperature is at least 10, the rod subtracts that cooling amount from terf_data_A.",
      "Steam emission starts when the block above is water and terf_data_A >= 500.",
      "Heat spread averages the current rod and the rod above. The combined temperature is split in half with remainder handling, then the current rod gains an extra +10 heat spike and terf_data_B increases by 1.",
      "Decay spread uses the same pairwise half-and-remainder pattern as temperature spread.",
      "If the rod still contains valid fission_fuel custom data and no neutron is already overlapping it, the rod summons two new neutrons."
    )
  }
  "opencore" = [ordered]@{
    Summary = "Vertical exotic core reactor with staged startup, coil heating and cooling, stabilizer requirements, and a long meltdown timeline."
    Description = @(
      "OpenCore is a staged reactor that uses a linked control panel to step through system check, indexing, charging, online processing, shutdown, and meltdown. Unlike the STFR, most of its active machine math is compact: it mainly converts panel inputs into core temperature change, watches structural tags, and advances scripted event timers.",
      "The online state is intentionally brittle. Missing coils or stabilizers, or sustained loss of buffer power, push the machine into the late-start meltdown path."
    )
    Values = @(
      "terf_data_A: UI state used by the control panel.",
      "terf_data_B: power laser input.",
      "terf_data_C: cooling laser input.",
      "terf_data_D: reactor state. 1 = system_check, 2 = indexing, 3 = charging, 4 = online, 5 = shutdown, 6 = meltdown.",
      "terf_data_E: event timer for the current state.",
      "terf_data_F: effect timer used by charging and other visuals.",
      "terf_data_G: core temperature.",
      "terf_data_H: distance between the top and bottom coils.",
      "terf_data_I: accumulated core damage caused by staying online without stored power.",
      "datapipes_lib_power_max: baseline power ceiling. System check raises it to 1000 at tick 97.",
      "Scratch score working_stabs: number of stabilizer tags currently present out of eight."
    )
    Calculations = @(
      "Baseline power drain every tick = datapipes_lib_power_max / 100, removed from datapipes_lib_power_storage.",
      "Online temperature change = + terf_data_B - terf_data_C while both top and bottom coils exist. Minimum temperature is clamped to -273.",
      "If working_stabs <= 4, the machine enters the late-start meltdown path.",
      "If no stored power remains while online, terf_data_I increases by 1 per tick. Meltdown starts once terf_data_I >= 400.",
      "Online phase completion uses the current recipe timer: once terf_data_E is greater than stored_recipe.operations[0].time, the machine runs phase_complete.",
      "Charging timeline: stabilizer beams start at tick 422, and the machine transitions to online at tick 475.",
      "System-check timeline: the timer can jump by +2 on low-beep ticks, and tick 97 marks the completion / power-max transition point.",
      "Meltdown timeline highlights: alarm at 30, major failure effects and advancement at 60, critical broadcast at 70, and completion at 710+."
    )
  }
  "warp_core" = [ordered]@{
    Summary = "Ship-moving warp multiblock that validates a bounded volume, checks the target site, charges its field, and either warps or overloads."
    Description = @(
      "Warp Core is a validation-heavy machine. Before it can move anything, it parses ship bounds and target coordinates from the linked panel, checks the source and destination volumes, and counts blocked or immovable blocks.",
      "Once a warp begins, the core becomes a timed event machine. Its timer drives charge-up visuals, field displays, the actual ship move, cleanup, and the overload / detonation escalation path."
    )
    Values = @(
      "terf_data_A: state. 0 = offline, 1 = warping, 2 = overload, 3 = detonation.",
      "terf_data_B: blocked target-block count.",
      "terf_data_C: immovable ship-block count.",
      "terf_data_D: ship block count. The power screen also uses it as the required power denominator.",
      "terf_data_E: event timer.",
      "terf_data_F: stored power normalized by the per-block requirement configured for the machine.",
      "terf_data_R, terf_data_S, terf_data_T: ship offset from the core in x/y/z.",
      "terf_data_U, terf_data_V, terf_data_W: ship size / far-edge bounds in x/y/z.",
      "terf_data_X, terf_data_Y, terf_data_Z: target coordinates.",
      "data.terf.dim: target dimension.",
      "datapipes_lib_power_max: initialized to 4000000.",
      "datapipes_lib_power_storage: initialized to 0."
    )
    Calculations = @(
      "Validation bootstrap sets terf_data_B, terf_data_C, and terf_data_D to 2147483647 before the source and target checks repopulate them.",
      "The panel power screen shows power_stored = terf_data_F, power_required = terf_data_D, and power_buffer = datapipes_lib_power_storage.",
      "Warp start sets terf_data_A = 1 and resets terf_data_E = 0.",
      "Display volume formulas reuse the ship extents: several field effects use size * 2 + 1, while the vertical charge display uses y * 4 + 1 at quarter-block scale.",
      "Warp timeline milestones: cube visuals at 245, actual warp at 250, cube cleanup at 350, and full cleanup / reset at 410+.",
      "During overload, containment slows the timer by subtracting 4 each tick while terf_data_E <= 1800. If the timer still reaches 2000, the machine starts detonation.",
      "Overload warning beats happen at 1800..1802, the siren starts at 1810, and the overheat text color is derived from timer-driven RGB math."
    )
  }
  "fission_fuel_loader" = [ordered]@{
    Summary = "Loader that converts pellet items into a spawned fission fuel rod over a fixed progress window."
    Description = @(
      "The Fission Fuel Loader is a timed assembly machine. It reads fuel type metadata from the center inventory slot, consumes pellets in steps, and on completion spawns a terf_fuel_rod marker above itself with copied custom fuel data.",
      "The loader is intentionally simple: all of its persistent progress lives in one counter and one cached NBT field for the currently loaded fuel type."
    )
    Values = @(
      "terf_data_A: load progress counter.",
      "data.terf.fission_fuel_loader.loading_type: cached fuel type copied from slot 2 when a new loading cycle begins.",
      "Scratch score terminated: set by validation helpers so the loader can abort and reset early if the structure or inventory is invalid."
    )
    Calculations = @(
      "Every successful operation tick adds 1 to terf_data_A.",
      "Every 20 progress points, the loader plays the pellet-loading sound and decrements one item from slot 2.",
      "Completion threshold: terf_data_A >= 200.",
      "On completion, the machine summons a terf_fuel_rod marker, copies the stored fuel data into it, resets terf_data_A to 0, and clears the cached loading type.",
      "The completion path also copies the current slot-2 item into temporary storage with count = 10, then runs add_fuel one block above to refill the placed rod structure."
    )
  }
  "fission_reactor_panel" = [ordered]@{
    Summary = "Readout panel that displays linked fission-sensor aggregates and alarms on unsafe rod temperatures."
    Description = @(
      "The Fission Reactor Panel is a display and relay machine. It clears its aggregate scratch scores every tick, asks the linked Fission Sensor to repopulate them, then formats the result into fuel-rod and reaction-status screens.",
      "Unlike the reactor rod logic, this panel does not keep meaningful persistent machine-local terf_data_* values in the scanned files. Its state is almost entirely the aggregate scoreboard values it rebuilds each refresh."
    )
    Values = @(
      "Global scratch score average_neutron_speed: running neutron-speed total divided into an average after sensor collection.",
      "Global scratch score neutron_flux: count of nearby neutron markers seen by the linked sensor.",
      "Global scratch score fuel_rod_count: count of nearby fuel-rod markers seen by the linked sensor.",
      "Global scratch score average_temp: running rod-temperature total divided into an average after sensor collection.",
      "Global scratch score max_temp: highest rod temperature seen this refresh. -69420 means no sensor data arrived and -420 means the sensor was present but found no rod data."
    )
    Calculations = @(
      "Average rod temperature = average_temp / fuel_rod_count.",
      "Average neutron speed = average_neutron_speed / neutron_flux.",
      "Alarm threshold: when max_temp >= 600, the panel colors the max-temperature line red and plays terf:alarms.alarm7.",
      "Display fallbacks are sentinel-based: -69420 becomes the red No Sensor screen, while -420 becomes the yellow No Rod Data screen."
    )
  }
  "opencore_control_panel" = [ordered]@{
    Summary = "Four-mode operator interface for OpenCore power lasers, cooling lasers, startup flow, and reactor statistics."
    Description = @(
      "The OpenCore Control Panel is a UI router. It does not simulate the reactor directly; it cycles between four screen groups, toggles selected vs. hover states, and forwards startup or shutdown commands to the linked OpenCore when the right conditions are met.",
      "This panel also owns a small amount of local UI animation state so button fills and selected pages can persist between clicks."
    )
    Values = @(
      "terf_data_A: panel screen-state selector. 0..3 are hover states for power laser, cooling laser, startup, and stats. 10..13 are the corresponding selected states.",
      "terf_data_B: local power-laser slider fill / click animation amount. The panel clamps it inside 0..100.",
      "terf_data_C: local cooling-laser slider fill / click animation amount. The panel clamps it inside 0..100.",
      "terf_data_D: linked reactor state mirrored from the core. The panel checks it to decide whether startup, charging, shutdown, or meltdown screens should be shown.",
      "terf_data_E: linked reactor event timer mirrored from the core and used for countdown text.",
      "Tag terf_displaytopcoil: toggles the stats page between top-coil and bottom-coil views."
    )
    Calculations = @(
      "Left-click navigation rotates the hover order backward (0 -> 3 -> 2 -> 1 -> 0) and also decrements local slider fills while the selected power-laser or cooling-laser page is open.",
      "Middle-click toggles between hover and selected states (0 <-> 10, 1 <-> 11, 2 <-> 12, 3 <-> 13). Startup and stats have extra guards so they collapse back to hover when the linked reactor is already busy.",
      "Right-click navigation rotates the hover order forward (0 -> 1 -> 2 -> 3 -> 0) and increments the local slider fills while the selected power-laser or cooling-laser page is open.",
      "Startup gating is source-backed: system check completes at 97 ticks, the panel advertises a 10MW+ requirement before indexing / charging, and shutdown only becomes available once no second operation phase remains."
    )
  }
  "stfr" = [ordered]@{
    Summary = "Large multi-state fusion reactor with shield, spin, pressure, coolant, capacitor, and event systems tied together through stabilizers and emergency controls."
    Description = @(
      "STFR is the largest state machine in this category. It maintains core temperature, spin, pressure, case temperature, coolant, steam, capacitor charge, broadcast state, multiple event branches, and six stabilizers that can fail independently.",
      "The core tick is structured in layers: it rebuilds fast scratch values, counts working stabilizers and turbines, applies state-specific behavior, and then runs the calculation pass that turns setpoints into shield stress, heating, cooling, fuel injection, and failure escalation."
    )
    Values = @(
      "terf_data_A: reactor status. 0 = offline, 1 = starting, 2 = startup confirmed, 3 = online, 4 = stopping, 5 = overload, 6 = meltdown, 7 = detonating, 8 = reaction loss, 9 = underload restabilization, 10 = in stasis, 11 = manual restabilization, 12 = startup overload, 13 = underload, 14 = sculk breakout, 15 = self destruct, 16 = stabilizer loss, 17 = shutdown failure.",
      "terf_data_B: shield intensity with *100 precision.",
      "terf_data_C: system-noise cooldown.",
      "terf_data_D: shield rotation state.",
      "terf_data_E: event timer.",
      "terf_data_F: stabilizer offset control.",
      "terf_data_G: stabilizer input / permeability control used by the core math.",
      "terf_data_H: power-laser setpoint.",
      "terf_data_I: pressure-vent setpoint.",
      "terf_data_J: fuel-injection setpoint.",
      "terf_data_K: RF-suppression setpoint.",
      "terf_data_L: core spin with *1000 precision.",
      "terf_data_M: core temperature with *1000 precision.",
      "terf_data_N: core pressure with *1000 precision.",
      "terf_data_O: case pressure with *10000 precision.",
      "terf_data_P: case temperature with *100000 precision.",
      "terf_data_Q: fuel stored locally with *1000 precision.",
      "terf_data_R: fuel stored in the core with *1000 precision.",
      "terf_data_S: previous broadcast warning level.",
      "terf_data_T: uptime in ticks.",
      "terf_data_U: dedicated power-surge timer / state.",
      "terf_data_V: stabilizer rotation state.",
      "terf_data_W: stabilizer animation state.",
      "terf_data_X: previous coolant amount.",
      "terf_data_Y: saved core temperature for automatic control.",
      "terf_data_Z: saved core spin for automatic control.",
      "terf_data_Aa: saved case pressure for automatic control.",
      "terf_data_Ab: event logistics.",
      "terf_data_Ac: radiation-surge counter / state.",
      "terf_data_Ad: capacitor charge.",
      "terf_data_Ae: broadcast limit / cooldown budget.",
      "terf_data_Af, terf_data_Ag, terf_data_Ah: generic event-storage slots used by scripted branches.",
      "Fluid slot 0: terf.high_pressure_steam, max 83580000.",
      "Fluid slot 1: water, max 3582000.",
      "Fluid slot 2: terf.gold_slurry, max 1000."
    )
    Calculations = @(
      "Working stabilizers begin at 6 and drop by 1 for each missing stabilizer tag.",
      "Reaction-rate multiplier from RF suppression = (400 - (terf_data_K * stabilizer_loss_multiplier)) / 4, with accuracy 100.",
      "Fuel-injection multiplier = terf_data_J * 24 before the reactor walks the injection list.",
      "Power-laser heating rate starts as terf_data_H * 50, is scaled by stabilizer loss, capped by available capacitor charge, multiplied by 1000, multiplied by 10 during power surge, and finally divided by core_shc before it is added into core_temp_change.",
      "Cooling begins only after the case is hotter than 100 C equivalent: cooling_rate = max(terf_data_P - 10000000, 0) / cooling_rate_divider.",
      "Capacitor charging steals part of the cooling budget. Up to 1000 charge units per tick can be diverted into terf_data_Ad before the remaining cooling is converted into coolant boil rate.",
      "Water-to-steam conversion uses coolant_boil_rate / 67, then multiplies removed coolant by 167 before adding it into the steam tank.",
      "Shield stress is the sum of pressure stress, spin stress, and the 'unknown' shield-collapse term derived from 1000000 - core_pressure.",
      "Shield intensity decreases by shield_stress / 50 once the shield is active and stress reaches 100+. If stress stays below 100, shield intensity slowly regenerates by +1 per tick up to 10000.",
      "Spin slow rate = floor(core_spin_abs / 4) plus extra penalties at high spin and case pressure, then plus any event-driven spin_slow_adder.",
      "Case blowout checks begin at case_pressure_divided >= 81156; case explosion checks begin at >= 95156.",
      "Case fire starts at case_temp_divided >= 1000, while case degradation starts at >= 1084 behind a predicate-gated random check."
    )
  }
  "multiblock_core" = [ordered]@{
    Summary = "Crafted controller item used to place and orient TERF multiblock structures."
    Description = @(
      "Multiblock Core is not an active machine controller script in the scanned sources. In this repo snapshot it is defined through recipe and advancement data, plus item lore that explains how the placed controller is meant to be used.",
      "The lore is the important gameplay clue: place the core on the ground, insert the required block, and keep the structure oriented correctly because rotation matters."
    )
    Values = @(
      "Recipe pattern: 231 / 444 / 132.",
      "Recipe key 1: minecraft:diamond.",
      "Recipe key 2: minecraft:redstone_torch.",
      "Recipe key 3: minecraft:iron_block.",
      "Recipe key 4: minecraft:copper_block.",
      "Result item model: terf:visual/multiblock_core.",
      "Result item name: Multiblock Core.",
      "Result rarity: rare.",
      "Result entity payload: places a marker with tag terf_multiblockcore.",
      "Runtime scoreboard values: no machine-local terf_data_* values were documented in the scanned recipe / advancement sources."
    )
    Calculations = @(
      "No machine-local runtime calculations were documented in the scanned sources for this entry.",
      "The only source-backed assembly logic here is the shaped crafting pattern and the placement / rotation guidance embedded in the item lore."
    )
  }
  "hadron_collider" = [ordered]@{
    Summary = "Recipe-driven collider that measures its ring, burns power by beam length, and can destabilize into explosions when the configured recipe is too demanding."
    Description = @(
      "The Hadron Collider is a beam machine with a stored recipe, a remaining-shot counter, and a measured ring length. Every active tick it drains power based on current ring length, and every firing cycle it raycasts the ring again before updating its power ceiling and checking for instability.",
      "Its control panel exposes three separate views: status and elapsed time, current power / shots / recipe id, and the measured ring length with the live injection multiplier."
    )
    Values = @(
      "terf_data_A: shots left in the currently loaded recipe.",
      "terf_data_B: uptime / retry timer.",
      "terf_data_C: measured ring length.",
      "terf_data_D: injection multiplier. Setup initializes it to 1, and the side buttons clamp it inside 1..16 in practice.",
      "datapipes_lib_power_storage: live power buffer. The collider refuses to fire unless at least 10000 is available.",
      "datapipes_lib_power_max: recalculated from ring length as length * 1600."
    )
    Calculations = @(
      "Idle setup power ceiling starts at 100000, but every measured firing cycle overwrites it with terf_data_C * 1600.",
      "Active per-tick power drain = terf_data_C * 16.",
      "The machine only enters operation when terf_data_A >= 1 and datapipes_lib_power_storage >= 10000.",
      "Instability check: the machine reads stored_recipe.l, multiplies it by terf_data_D, and compares it against the measured ring length. If the scaled recipe requirement is greater than the ring length, the collider destabilizes instead of cleanly finishing the shot.",
      "Error recovery timer: while failed, terf_data_B counts up until 1250, then the machine clears terf_hadronfailed and resets the timer to 0.",
      "Panel status codes are source-backed: 1 = collider running, 2 = low power, 3 = no valid recipe, 5 = error / retrying, 6 = interface broken.",
      "Beam explosion staging uses stepped length thresholds after an internal +20 offset. Extra explosion steps appear at effective lengths 335, 668, 1000, 1334, 1667, and 2000."
    )
  }
  "stasis_laser" = [ordered]@{
    Summary = "Validation-heavy support laser that checks a reactor port, follows a cable path to a laser head, charges for 100 ticks, and then fires."
    Description = @(
      "Stasis Laser is closer to a scripted event trigger than a steady-state machine. A button press validates the port structure, checks for a fuel block, recursively walks piston cabling to find a laser assembly and linked reactor, and only then starts its timed charge-up.",
      "Once armed, the machine counts upward until it reaches the firing threshold. During the charge window it drives screen text, particles, sounds, screenshake, and the linked beam marker."
    )
    Values = @(
      "terf_data_A: charge / activation timer. 1..99 is the charging window, 100 fires the machine, and the beam marker will stop it again if the timer reaches 1000+ during extended operation.",
      "Scratch score status: validation state. 0 = no laser found, 1 = laser structure broken, 2 = no reactor found, 3 = no power source, 4 = ready for firing but final condition not met, 5 = fully validated and ready to activate.",
      "Scratch score terminated: recursion guard for cable and raycast scans. Validation paths initialize it to 100 and decrement it every step.",
      "Scratch score has_fuel: set to 1 when the block below the port power location is a minecraft:netherite_block.",
      "Scratch score succeeded: local structure-validation success flag.",
      "Linked reactor state: as_reactor.mcfunction checks the reactor it found and only upgrades the status to the final activation state when that reactor matches the required machine state."
    )
    Calculations = @(
      "Charge-up is linear: each active tick adds 1 to terf_data_A.",
      "The top-line standby text appends one extra . every 5 ticks while terf_data_A < 100.",
      "A major sound cue starts at charge 35, while ominous-spawning particles continue through charge 70.",
      "Firing threshold: terf_data_A = 100.",
      "Both cable tracing and laser raycasting stop early when terminated reaches 0, which prevents infinite recursive scans through malformed builds."
    )
  }
  "warp_core_panel" = [ordered]@{
    Summary = "Sign-driven configuration panel for warp bounds, target coordinates, and target dimension."
    Description = @(
      "Warp Core Panel is a parser and sanitizer. It reads text from several signs, converts those strings into bounded numeric values, and writes the cleaned result back onto the linked Warp Core marker.",
      "The panel also rewrites bad input in place, so invalid numbers and dimensions fall back to safe defaults instead of leaving the core with unusable coordinates."
    )
    Values = @(
      "terf_data_R, terf_data_S, terf_data_T: negative-side ship offsets for x/y/z written from the from X/Y/Z sign.",
      "terf_data_U, terf_data_V, terf_data_W: positive-side ship bounds for x/y/z written from the to X/Y/Z sign.",
      "terf_data_X, terf_data_Y, terf_data_Z: target coordinates after the parser adjusts for offsets.",
      "data.terf.dim: target dimension parsed from the dimension sign. Invalid input falls back to minecraft:overworld.",
      "warp_core_max_size: global clamp used to limit both negative and positive bounds."
    )
    Calculations = @(
      "Negative bound minimums are hard-coded: X >= 3, Y >= 8, Z >= 3.",
      "Positive bound minimums are the same: X >= 3, Y >= 8, Z >= 3.",
      "Both negative and positive bounds clamp to warp_core_max_size before being written into the core.",
      "Positive-side values are stored as parsed_positive + negative_offset, so the core receives absolute far-edge extents rather than just the raw sign numbers.",
      "If target coordinates are invalid, the parser falls back to the core's current position. X and Z are then offset by terf_data_R and terf_data_T, while Y is adjusted by terf_data_S.",
      "If target dimension parsing fails, the panel rewrites the sign to minecraft:overworld and stores that dimension on the linked core."
    )
  }
  "laser" = [ordered]@{
    Summary = "Straight-beam machine that reads a requested power setting from signs, smooths the change, and converts power directly into beam damage."
    Description = @(
      "Laser is a relatively compact machine. It reads a requested power value from wall-sign screens, consumes that much buffer power every tick, and smooths the displayed / applied beam power so the number does not jump instantly from one setting to another.",
      "Once active, the machine determines its travel axis from rotation, builds a beam-argument payload with color and damage, and recursively steps forward until it hits a block or its recursion guard expires."
    )
    Values = @(
      "terf_data_A: smoothed live power level used for beam output.",
      "datapipes_lib_power_storage: current power buffer. The machine subtracts the requested sign power from this every tick.",
      "datapipes_lib_power_max: computed as requested_power * 100.",
      "Scratch score power: requested output read from the side signs before smoothing.",
      "Scratch score axis: beam travel axis. The code uses 1 or 3 depending on rotation.",
      "Scratch score terminated: recursion guard for the beam step loop, initialized to 200."
    )
    Calculations = @(
      "Requested power is read from the adjacent signs and clamped to 0+.",
      "Every tick, datapipes_lib_power_storage -= requested_power, then the buffer is clamped back to 0 if it underflows.",
      "Power ceiling = requested_power * 100.",
      "Smoothing rule: if requested power is lower than terf_data_A, subtract 1; if it is higher, add 1; then use the new terf_data_A as the actual beam power.",
      "Beam damage = power * 0.01.",
      "The beam only starts when the machine still has at least as much stored power as the current requested power.",
      "The step loop aborts after 200 recursive beam segments."
    )
  }
}

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

function Paragraph-ListHtml {
  param([object[]]$Items)

  if (-not $Items -or $Items.Count -eq 0) {
    return "<p class=`"empty-note`">No source-backed prose was added for this section yet.</p>"
  }

  $lines = foreach ($item in $Items) {
    "<p>" + (Escape-Html ([string]$item)) + "</p>"
  }

  return ($lines -join "`n")
}

function Bullet-ListHtml {
  param([object[]]$Items)

  if (-not $Items -or $Items.Count -eq 0) {
    return "<p class=`"empty-note`">No source-backed items were added for this section yet.</p>"
  }

  $lines = foreach ($item in $Items) {
    "<li>" + (Escape-Html ([string]$item)) + "</li>"
  }

  return "<ul class=`"detail-list`">`n$($lines -join "`n")`n</ul>"
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

foreach ($customKey in $customEntryDocs.Keys) {
  if ($entries.ContainsKey($customKey)) {
    $customDoc = $customEntryDocs[$customKey]
    if ($customDoc.Summary) {
      $entries[$customKey].Summary = $customDoc.Summary
    }
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
  $customSections = ""

  if ($customEntryDocs.ContainsKey($entry.Key)) {
    $customDoc = $customEntryDocs[$entry.Key]
    $descriptionHtml = Paragraph-ListHtml $customDoc.Description
    $valuesHtml = Bullet-ListHtml $customDoc.Values
    $calculationsHtml = Bullet-ListHtml $customDoc.Calculations
    $customSections = @"
        <section class="doc-section">
          <h2>Description</h2>
          $descriptionHtml
        </section>

        <section class="doc-section">
          <h2>Value Breakdown</h2>
          $valuesHtml
        </section>

        <section class="doc-section">
          <h2>Calculations</h2>
          $calculationsHtml
        </section>

"@
  }

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

        $customSections

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
    <script src="./glossary-search.js" defer></script>
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

        <section class="doc-section glossary-search-section">
          <div class="glossary-search-shell">
            <label class="glossary-search-label" for="glossary-search">Search Glossary</label>
            <input
              class="glossary-search-input"
              id="glossary-search"
              type="search"
              placeholder="Search categories, groups, and descriptions..."
              autocomplete="off"
              data-glossary-search
            />
            <p class="glossary-search-status" data-glossary-search-status>
              Showing all glossary groups.
            </p>
          </div>
        </section>

        <section class="doc-section">
          <h2>Browse By Category</h2>
          <div class="glossary-stack">
            $($glossaryGroupsHtml -join "`n")
          </div>
          <p class="empty-note glossary-empty-state" data-glossary-empty hidden>
            No glossary groups matched that search yet.
          </p>
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

