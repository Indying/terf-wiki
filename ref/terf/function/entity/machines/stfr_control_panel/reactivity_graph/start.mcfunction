#load values & skip if core is empty
data modify storage terf:temp array set from entity @s data.terf.core_contents
execute unless data storage terf:temp array[0] run return run data modify entity @s data.terf.reactivity_graph set value "-:-"

#set the peak temp for reactivity to fit the graph horizontally
scoreboard players set peak_kev terf_states 2000000

#calculate core temperature in kiloelectronvolts
scoreboard players operation temp_kev terf_states = @s terf_data_M
scoreboard players operation temp_kev terf_states /= 11604 terf_states
scoreboard players operation temp_kev terf_states *= 1000 terf_states

#iterate 74x for each segment of the graph
scoreboard players set prev_step terf_states 0
scoreboard players set n terf_states 0
data modify storage terf:temp stfr_dedicated.reactivity_graph set value [""]

function terf:entity/machines/stfr_control_panel/reactivity_graph/iterate

#save values
data modify entity @s data.terf.reactivity_graph set from storage terf:temp stfr_dedicated.reactivity_graph
