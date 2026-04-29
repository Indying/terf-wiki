scoreboard players set toggle terf_states -1
execute if score @s terf_data_A matches 0 run scoreboard players set toggle terf_states 3
execute if score @s terf_data_A matches 1 run scoreboard players set toggle terf_states 0
execute if score @s terf_data_A matches 2 run scoreboard players set toggle terf_states 1
execute if score @s terf_data_A matches 3 run scoreboard players set toggle terf_states 2

execute if score @s terf_data_A matches 10 unless score @s terf_data_B matches ..0 run scoreboard players remove @s terf_data_B 1
execute if score @s terf_data_A matches 11 unless score @s terf_data_C matches ..0 run scoreboard players remove @s terf_data_C 1

execute if score @s terf_data_A matches 12 unless score @s terf_data_D matches 1.. run function terf:entity/machines/opencore/states/system_check/start
execute if score @s terf_data_A matches 12 if score @s terf_data_D matches 1 if score @s terf_data_E matches 1..96 run scoreboard players set @s terf_data_D 0
execute if score @s terf_data_A matches 12 if score @s terf_data_D matches 1 if score @s[tag=terf_allsystemsworking] terf_data_E matches 97.. if score @s datapipes_lib_power_storage matches 10.. run function terf:entity/machines/opencore/states/indexing/start

execute if score @s terf_data_A matches 12 if score @s terf_data_D matches 2 if score @s terf_data_E matches 100.. unless data entity @s data.terf.stored_item run function terf:entity/machines/opencore/states/indexing/stop
execute if score @s terf_data_A matches 12 if score @s terf_data_D matches 2 if score @s[tag=terf_allsystemsworking] terf_data_E matches 100.. if score @s datapipes_lib_power_storage matches 1.. if data entity @s data.terf.stored_item run function terf:entity/machines/opencore/states/charging/start

execute if score @s terf_data_A matches 12 if score @s terf_data_D matches 4 unless data entity @s data.terf.stored_recipe.operations[1] run function terf:entity/machines/opencore/states/shutdown/start with entity @s data.terf.opencore

execute unless score toggle terf_states matches -1 run scoreboard players operation @s terf_data_A = toggle terf_states

scoreboard players set temp terf_states 0
execute as @s[tag=terf_displaytopcoil] run scoreboard players set temp terf_states 1
execute if score @s terf_data_A matches 13 if score temp terf_states matches 0 run tag @s add terf_displaytopcoil
execute if score @s terf_data_A matches 13 if score temp terf_states matches 1 run tag @s remove terf_displaytopcoil
