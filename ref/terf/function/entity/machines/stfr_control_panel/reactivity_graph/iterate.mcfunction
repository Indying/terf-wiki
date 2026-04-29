#store reactivity peak in temperature
scoreboard players operation @s terf_data_R = peak_kev terf_states
scoreboard players operation @s terf_data_R *= 11604 terf_states

#make peak always be on font #50
scoreboard players operation step terf_states = peak_kev terf_states
scoreboard players operation step terf_states /= 40 terf_states
scoreboard players operation step terf_states *= n terf_states

execute store result storage terf:temp stfr_dedicated.core_stats.input float 0.001 run scoreboard players get step terf_states
data modify storage terf:temp stfr_dedicated.array set from storage terf:temp array
function terf:entity/machines/stfr_control_panel/reactivity_graph/iterate_core_contents

#fit graph
execute if score released_energy terf_states > @s terf_data_Q run scoreboard players operation @s terf_data_Q = released_energy terf_states

#normalize to max released_energy
scoreboard players operation released_energy terf_states *= 246 terf_states
scoreboard players operation released_energy terf_states /= @s terf_data_Q

execute if score released_energy terf_states matches ..-1 run scoreboard players set released_energy terf_states 0
scoreboard players add released_energy terf_states 9
execute if score released_energy terf_states matches 256.. run scoreboard players set released_energy terf_states 255

execute store result storage terf:temp args.int int 1 run scoreboard players get released_energy terf_states
function terf:entity/machines/stfr_control_panel/reactivity_graph/args with storage terf:temp args

function terf:entity/machines/stfr_control_panel/reactivity_graph/append with storage terf:temp args

#display current temp
execute if score temp_kev terf_states >= prev_step terf_states if score temp_kev terf_states < step terf_states run data modify storage terf:temp stfr_dedicated.reactivity_graph[-1].color set value "#00FF00"
scoreboard players operation prev_step terf_states = step terf_states

#continue iterating
scoreboard players add n terf_states 1
execute if score n terf_states matches ..74 run function terf:entity/machines/stfr_control_panel/reactivity_graph/iterate