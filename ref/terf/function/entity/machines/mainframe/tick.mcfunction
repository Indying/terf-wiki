#terf_data_A = amount of servers connected
#terf_data_B = amount of input machines connected
#terf_data_C = machine selection GUI number
#terf_data_D = amount of output machines connected
#terf_data_E = machine linking GUI number
#terf_data_F = machine load
#terf_data_G = crashing cooldown

scoreboard players add @s terf_data_C 0

tag @s add terf_mainframe

execute if score NETratetimer terf_states >= NETrate terf_states if block ~ ~ ~ minecraft:lodestone run function terf:entity/machines/mainframe/slower_tick

execute unless score @s terf_data_G matches 1.. if score @s terf_data_A < @s terf_data_F run scoreboard players set @s terf_data_G 1300
execute if score @s terf_data_G matches 1.. run function terf:entity/machines/mainframe/rebooting
