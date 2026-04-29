execute as @s[tag=terf_random_vel] run function terf:entity/particle/homongous_flash/summon

scoreboard players set temp terf_states 255
scoreboard players operation temp terf_states -= @s terf_data_A

execute store result entity @s text_opacity byte 1 run scoreboard players get temp terf_states
