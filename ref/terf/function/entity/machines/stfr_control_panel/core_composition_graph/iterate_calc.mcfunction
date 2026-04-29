execute store result score percentage terf_states store result score remainder terf_states run data get storage terf:temp args.array[0].amount 100

#build computed array
data modify storage terf:temp temp set value {}
execute store result storage terf:temp temp.p int 1 run scoreboard players operation percentage terf_states /= total_amount terf_states
execute store result storage terf:temp temp.r int 1 run scoreboard players operation remainder terf_states %= total_amount terf_states
data modify storage terf:temp array2 append from storage terf:temp temp

scoreboard players operation total_percentage terf_states += percentage terf_states

#continue iterating
data remove storage terf:temp args.array[0]
execute if data storage terf:temp args.array[0] run function terf:entity/machines/stfr_control_panel/core_composition_graph/iterate_sum