#calculate the amount of energy release for the temperature
$execute store result score reaction_rate terf_states run function $(reactivity_function) with storage terf:temp stfr_dedicated.core_stats

execute store result storage terf:temp args.float double 0.01 run scoreboard players get reaction_rate terf_states
execute store result score temp terf_states run data get storage terf:temp stfr_dedicated.array[0].fusion.kev_total
function terf:entity/machines/stfr/calculations/multiply_float with storage terf:temp args
execute store result score temp terf_states run data get storage terf:temp args.float
scoreboard players operation released_energy terf_states += temp terf_states
