scoreboard players remove terminated terf_states 1
data modify storage terf:temp displays.group_core[2].messages[1] append from storage terf:temp temp
execute if score terminated terf_states matches 1.. run function terf:entity/machines/stfr_control_panel/core_composition_graph/replicate_string