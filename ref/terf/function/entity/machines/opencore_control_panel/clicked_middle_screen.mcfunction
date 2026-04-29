scoreboard players set toggle terf_states -1
execute if score @s terf_data_A matches 0 run scoreboard players set toggle terf_states 10
execute if score @s terf_data_A matches 10 run scoreboard players set toggle terf_states 0

execute if score @s terf_data_A matches 1 run scoreboard players set toggle terf_states 11
execute if score @s terf_data_A matches 11 run scoreboard players set toggle terf_states 1

execute if score @s terf_data_A matches 2 run scoreboard players set toggle terf_states 12
execute if score @s terf_data_A matches 12 unless score @s terf_data_D matches 1.. run scoreboard players set toggle terf_states 2
execute if score @s terf_data_A matches 12 if score @s terf_data_D matches 4 run scoreboard players set toggle terf_states 2

execute if score @s terf_data_A matches 12 if score @s terf_data_D matches 1 if score @s terf_data_E matches 97.. run scoreboard players set toggle terf_states 2

execute if score @s terf_data_A matches 3 run scoreboard players set toggle terf_states 13
execute if score @s terf_data_A matches 13 run scoreboard players set toggle terf_states 3

execute if score @s terf_data_A matches 12 if score @s terf_data_D matches 2 if score @s terf_data_E matches 100.. if data entity @s data.terf.stored_item run function terf:entity/machines/opencore/states/indexing/stop

execute if score @s terf_data_A matches 12 if score @s terf_data_D matches 3 if score @s terf_data_A matches 12 run scoreboard players set toggle terf_states 2

execute unless score toggle terf_states matches -1 run scoreboard players operation @s terf_data_A = toggle terf_states