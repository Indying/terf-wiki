execute store result score temp terf_states run data get storage terf:temp args.array[0].core_amount
scoreboard players operation total_amount terf_states += temp terf_states
data remove storage terf:temp args.array[0]
execute if data storage terf:temp args.array[0] run function terf:entity/machines/stfr_control_panel/core_composition_graph/iterate_sum