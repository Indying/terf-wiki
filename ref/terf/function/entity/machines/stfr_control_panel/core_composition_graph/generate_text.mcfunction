execute store result score terminated terf_states run data get storage terf:temp args.array[0].core_amount 100

#build computed array
data modify storage terf:temp temp2[0] set from storage terf:temp args.array[0].chem
data modify storage terf:temp displays.group_core[2].messages[2] append from storage terf:temp temp2

data modify storage terf:temp temp.color set from storage terf:temp args.array[0].color_hex
scoreboard players operation terminated terf_states /= total_amount terf_states
execute if score terminated terf_states matches 101.. run scoreboard players set terminated terf_states 100
function terf:entity/machines/stfr_control_panel/core_composition_graph/replicate_string

#continue iterating
data remove storage terf:temp args.array[0]
execute if data storage terf:temp args.array[0] run function terf:entity/machines/stfr_control_panel/core_composition_graph/generate_text