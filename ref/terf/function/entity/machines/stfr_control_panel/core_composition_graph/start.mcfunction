data modify storage terf:temp array set from entity @s data.terf.core_contents
execute unless data storage terf:temp array[0] run return run data modify storage terf:temp displays.group_core[2].messages[1] set value "-:-"

#get the sum of all numbers
scoreboard players set total_amount terf_states 0
data modify storage terf:temp args.array set from storage terf:temp array
function terf:entity/machines/stfr_control_panel/core_composition_graph/iterate_sum

#calculate base percentages and remainders
#scoreboard players set total_percentage terf_states 0
#data modify storage terf:temp array2 set value []
data modify storage terf:temp args.array set from storage terf:temp array
data modify storage terf:temp temp set value {text:""}
data modify storage terf:temp temp2 set value ["?"," "]
function terf:entity/machines/stfr_control_panel/core_composition_graph/generate_text

# honestly, performance is more important than the graph slightly jumping visually, il implement it once i find a performant way to sort arrays

#function terf:entity/machines/stfr_control_panel/core_composition_graph/iterate_calc

#if it dosent add up to 100, add 1 to the percentages with the largest remainders in array2 until it is 100
#execute if score total_percentage terf_states matches 100.. run return fail
#data modify storage terf:temp args.array set from storage terf:temp array2
#function terf:entity/machines/stfr_control_panel/core_composition_graph/iterate_remainders
