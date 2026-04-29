#get variables
execute on passengers run scoreboard players operation power_storage terf_states = @s[type=marker] datapipes_lib_power_storage
execute on passengers run scoreboard players operation power_max terf_states = @s[type=marker] datapipes_lib_power_max

scoreboard players set sneaking terf_states 0
execute on target if predicate datapipes_lib:pressing_sneak run scoreboard players set sneaking terf_states 1

#click beep boop
execute if score @s terf_data_A matches 1.. run return run function terf:entity/player/tool/electron_bomb/interaction/display_time

execute unless block ^ ^ ^1 granite_slab[type=double] run return run function terf:entity/player/tool/electron_bomb/interaction/add_time

execute if score sneaking terf_states matches 1 run return run function terf:entity/player/tool/electron_bomb/interaction/reset_averages

function terf:entity/player/tool/electron_bomb/interaction/display_stats