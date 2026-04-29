execute if entity @s[tag=!terf_collider_case] run return fail
scoreboard players add @s terf_data_B 1

scoreboard players operation temp terf_states = @s terf_data_B
scoreboard players operation temp terf_states %= 70 terf_states
execute if score temp terf_states matches 0 if block ~ ~5 ~ minecraft:note_block run playsound terf:alarms.alarm5 master @a[distance=0..] ~ ~ ~ 5

execute if score @s terf_data_B matches 1250.. run tag @s remove terf_hadronfailed
execute if score @s terf_data_B matches 1250.. run scoreboard players set @s terf_data_B 0
