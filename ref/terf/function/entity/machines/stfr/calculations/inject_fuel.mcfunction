$execute store result score fuel_amount terf_states run data get entity @s data.terf.core_contents[{id:'$(id)'}].core_amount
$execute unless data entity @s data.terf.core_contents[{id:'$(id)'}] run function terf:entity/machines/stfr/calculations/add_fluid_to_core {result:'$(id)'}

scoreboard players operation amount terf_states /= 24 terf_states
scoreboard players operation amount terf_states *= 100 terf_states
scoreboard players operation fuel_amount terf_states += amount terf_states

$execute store result entity @s data.terf.core_contents[{id:'$(id)'}].core_amount int 1 run scoreboard players get fuel_amount terf_states

#########################
#calculate how much energy is required to heat up the fuel to the current core temp
execute store result storage terf:temp args.float double 0.001 run scoreboard players get amount terf_states
#multiply by the shc (1000 precision)
scoreboard players set temp terf_states 27151
function terf:entity/machines/stfr/calculations/multiply_float with storage terf:temp args
execute store result score injected_mass_heat_capacity terf_states run data get storage terf:temp args.float

execute store result storage terf:temp args.float double 0.001 run scoreboard players get core_amount terf_states
#multiply by the shc (1000 precision)
scoreboard players set temp terf_states 27151
function terf:entity/machines/stfr/calculations/multiply_float with storage terf:temp args
execute store result score divider terf_states run data get storage terf:temp args.float

scoreboard players operation divider terf_states += injected_mass_heat_capacity terf_states
scoreboard players operation divider terf_states /= 100000 terf_states
scoreboard players operation injected_mass_heat_capacity terf_states /= divider terf_states

#initial temperature of the fuel injected
scoreboard players set multiplier terf_states 22
scoreboard players operation multiplier terf_states -= @s terf_data_M

execute store result storage terf:temp args.float double 0.000001 run scoreboard players get injected_mass_heat_capacity terf_states
scoreboard players operation temp terf_states = multiplier terf_states
function terf:entity/machines/stfr/calculations/multiply_float with storage terf:temp args
execute store result score temp terf_states run data get storage terf:temp args.float
#scoreboard players operation core_temp_change terf_states += temp terf_states

#fix for future iterations
scoreboard players operation core_amount terf_states += amount terf_states
