execute unless score @s datapipes_lib_power_max = @s datapipes_lib_power_max run return fail

#calculate how much charge is needed
scoreboard players operation temp terf_states = @s datapipes_lib_power_max
scoreboard players operation temp terf_states -= @s datapipes_lib_power_storage
execute if score temp terf_states > power_storage terf_states run scoreboard players operation temp terf_states = power_storage terf_states

scoreboard players operation @s datapipes_lib_power_storage += temp terf_states
scoreboard players operation power_storage terf_states -= temp terf_states