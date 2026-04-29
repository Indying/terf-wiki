# terf_data_A = power generation
execute unless function terf:entity/machines/solar_panel/structure_checks run return fail

#safeguard
scoreboard players add @s terf_data_C 0
execute unless score @s terf_data_C matches 0 run function datapipes_lib:require/contingency

#get power generation multiplier based on time and dimensions
function terf:entity/machines/solar_panel/get_time_multiplier

#power generation
scoreboard players operation power terf_states = @s terf_data_A
scoreboard players operation power terf_states *= time_multiplier terf_states
scoreboard players operation power terf_states /= solar_panel_generation_divider terf_states
execute if score power terf_states matches ..-1 run scoreboard players set power terf_states 0

#display
scoreboard players operation blocked terf_states = @s terf_data_B
scoreboard players operation power_stored terf_states = @s datapipes_lib_power_storage
data merge block ^ ^1 ^1 {is_waxed:1b,front_text:{messages:[{text:"   Solar Panel   ",underlined:1b},["Gen: ",{"score":{"name":"power","objective":"terf_states"},color:"#222200"},{text:"MW",color:"#222200"}],["Stor: ",{"score":{"name":"power_stored","objective":"terf_states"},color:"#222200"},{text:"MWt",color:"#222200"}],["Blocked: ",{"score":{"name":"blocked","objective":"terf_states"}}]],color:yellow,has_glowing_text:1b}}
execute if score blocked terf_states matches 1.. run data modify block ^ ^1 ^1 front_text.color set value red

#power storage
scoreboard players operation @s datapipes_lib_power_max = @s terf_data_A
scoreboard players operation @s datapipes_lib_power_max *= 6000 terf_states
scoreboard players operation @s datapipes_lib_power_max /= solar_panel_generation_divider terf_states
scoreboard players operation @s datapipes_lib_power_max *= 100 terf_states

#add to power
scoreboard players operation power terf_states *= NETrate terf_states
scoreboard players operation @s datapipes_lib_power_storage += power terf_states
execute if score @s datapipes_lib_power_storage > @s datapipes_lib_power_max run scoreboard players operation @s datapipes_lib_power_storage = @s datapipes_lib_power_max

