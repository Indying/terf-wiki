execute as @s[tag=terf_random_vel] run function terf:entity/particle/small_flash/summon

scoreboard players set temp terf_states 32
scoreboard players operation temp terf_states -= @s terf_data_A
scoreboard players operation temp terf_states *= 8 terf_states

execute store result entity @s text_opacity byte 1 run scoreboard players get temp terf_states
