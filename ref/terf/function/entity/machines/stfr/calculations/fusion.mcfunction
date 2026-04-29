#load values
$execute store result score reaction_rate terf_states run function $(reactivity_function) with storage terf:temp stfr_dedicated.core_stats
execute if score reaction_rate terf_states matches ..-1 run scoreboard players set reaction_rate terf_states 0

execute store result score in_per_out terf_states run data get storage terf:temp stfr_dedicated.array[0].fusion.in_per_out
execute if score in_per_out terf_states matches 1.. store result score waste_buffer terf_states run data get storage terf:temp stfr_dedicated.array[0].waste_buffer

#calculate reaction rate
execute store result storage terf:temp args.float double 0.0000000017 run scoreboard players get reaction_rate terf_states
scoreboard players operation temp terf_states = core_amount terf_states
function terf:entity/machines/stfr/calculations/multiply_float with storage terf:temp args

scoreboard players operation temp terf_states = reaction_rate_multiplier terf_states
function terf:entity/machines/stfr/calculations/multiply_float with storage terf:temp args

execute store result score reaction_rate terf_states run data get storage terf:temp args.float

#use fuel and produce produce "waste"
scoreboard players operation core_amount terf_states -= reaction_rate terf_states

execute if score in_per_out terf_states matches 1.. run scoreboard players operation waste_buffer terf_states += reaction_rate terf_states
execute if score in_per_out terf_states matches 1.. run scoreboard players operation temp terf_states = waste_buffer terf_states
execute if score in_per_out terf_states matches 1.. run scoreboard players operation temp terf_states /= in_per_out terf_states
execute if score in_per_out terf_states matches 1.. run scoreboard players operation waste_buffer terf_states %= in_per_out terf_states

execute if score in_per_out terf_states matches ..-1 run scoreboard players operation temp terf_states = reaction_rate terf_states
execute if score in_per_out terf_states matches ..-1 run scoreboard players operation temp terf_states *= in_per_out terf_states
execute if score in_per_out terf_states matches ..-1 run scoreboard players operation temp terf_states *= -1 terf_states

$execute store result score waste_amount terf_states run data get storage terf:temp stfr_dedicated.array[{id:'$(result)'}].core_amount
$execute unless data storage terf:temp stfr_dedicated.array[{id:'$(result)'}] run function terf:entity/machines/stfr/calculations/add_fluid_to_core with storage terf:temp stfr_dedicated.array[0].fusion
scoreboard players operation waste_amount terf_states += temp terf_states
$execute store result storage terf:temp stfr_dedicated.array[{id:'$(result)'}].core_amount int 1 run scoreboard players get waste_amount terf_states

#increase temperature (core output kw has the accuracy of 10)
execute store result score temp terf_states run data get storage terf:temp stfr_dedicated.array[0].fusion.kev_total 0.862
scoreboard players operation temp terf_states *= reaction_rate terf_states
scoreboard players operation core_output_kw terf_states += temp terf_states

#save values
scoreboard players operation total_reaction_rate terf_states += reaction_rate terf_states
scoreboard players operation rad_generation terf_states += reaction_rate terf_states
execute if score in_per_out terf_states matches 1.. store result storage terf:temp stfr_dedicated.array[0].waste_buffer int 1 run scoreboard players get waste_buffer terf_states
