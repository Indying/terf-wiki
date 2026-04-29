execute as @s[tag=terf_random_vel] run function terf:entity/particle/light_beam/summon

scoreboard players set temp terf_states 20
scoreboard players operation temp terf_states -= @s terf_data_A
scoreboard players operation temp terf_states *= 6 terf_states

execute store result entity @s text_opacity byte 1 run scoreboard players get temp terf_states
