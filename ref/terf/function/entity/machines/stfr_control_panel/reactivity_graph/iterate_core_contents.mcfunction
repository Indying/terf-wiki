#if the fluid has a fusion function
function terf:entity/machines/stfr_control_panel/reactivity_graph/fusion with storage terf:temp stfr_dedicated.array[0].fusion

#continue iterating
data remove storage terf:temp stfr_dedicated.array[0]
execute if data storage terf:temp stfr_dedicated.array[0] run function terf:entity/machines/stfr_control_panel/reactivity_graph/iterate_core_contents
