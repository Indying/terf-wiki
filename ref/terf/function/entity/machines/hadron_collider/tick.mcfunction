#terf_data_A = shots left
#terf_data_B = uptime
#terf_data_C = length
#terf_data_D = injection multiplier

scoreboard players operation temp terf_states = @s terf_data_C
scoreboard players operation temp terf_states *= 16 terf_states
scoreboard players operation @s datapipes_lib_power_storage -= temp terf_states
execute if score @s datapipes_lib_power_storage matches ..0 run function terf:entity/machines/hadron_collider/stop

execute if score NETratetimer terf_states >= NETrate terf_states run function terf:entity/machines/hadron_collider/slower_tick
execute as @s[tag=terf_hadronfailed] run return run function terf:entity/machines/hadron_collider/rebooting

execute if score @s terf_data_A matches 1.. if score @s datapipes_lib_power_storage matches 10000.. run function terf:entity/machines/hadron_collider/operation
