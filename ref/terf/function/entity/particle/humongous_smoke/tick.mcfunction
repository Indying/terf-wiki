execute as @s[tag=terf_random_vel] run function terf:entity/particle/humongous_smoke/random_velocity
execute as @s[tag=terf_random_col] run function terf:entity/particle/humongous_smoke/random_color

scoreboard players set temp terf_states 408
scoreboard players operation temp terf_states -= @s terf_data_A

scoreboard players operation @s terf_data_X *= 99 terf_states
scoreboard players operation @s terf_data_Y *= 99 terf_states
scoreboard players operation @s terf_data_Z *= 99 terf_states

scoreboard players operation @s terf_data_X /= 100 terf_states
scoreboard players operation @s terf_data_Y /= 100 terf_states
scoreboard players operation @s terf_data_Z /= 100 terf_states

scoreboard players add @s terf_data_X 2
scoreboard players add @s terf_data_Y 1
scoreboard players add @s terf_data_Z 2

execute store result entity @s text_opacity byte 0.5 run scoreboard players get temp terf_states