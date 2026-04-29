scoreboard players set toggle terf_states -1
execute if score @s terf_data_A matches 3 run scoreboard players set toggle terf_states 0
execute if score @s terf_data_A matches 2 run scoreboard players set toggle terf_states 3
execute if score @s terf_data_A matches 1 run scoreboard players set toggle terf_states 2
execute if score @s terf_data_A matches 0 run scoreboard players set toggle terf_states 1

execute if score @s terf_data_A matches 10 unless score @s terf_data_B matches 100.. run scoreboard players add @s terf_data_B 1
execute if score @s terf_data_A matches 11 unless score @s terf_data_C matches 100.. run scoreboard players add @s terf_data_C 1

execute if score @s terf_data_A matches 12 if score @s terf_data_D matches 1 if score @s terf_data_E matches 97.. run function terf:entity/machines/opencore/states/system_check/stop

execute unless score toggle terf_states matches -1 run scoreboard players operation @s terf_data_A = toggle terf_states