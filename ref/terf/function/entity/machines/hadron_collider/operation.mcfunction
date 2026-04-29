scoreboard players add @s terf_data_B 1
scoreboard players operation temp terf_states = @s terf_data_B
scoreboard players operation temp terf_states %= 60 terf_states

execute unless score temp terf_states matches 59 run return fail
execute as @s[tag=terf_collider_case] if score @s datapipes_lib_power_storage matches 1.. run function terf:entity/machines/hadron_collider/shoot
