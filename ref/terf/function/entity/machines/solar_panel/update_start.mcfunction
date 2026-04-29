scoreboard players set @s terf_data_C 0

scoreboard players set power terf_states 0
scoreboard players set blocked terf_states 0
execute positioned ^ ^1 ^ run function terf:entity/machines/solar_panel/wire_checks/pipes_on

#save values
scoreboard players operation @s terf_data_B = blocked terf_states
scoreboard players operation @s terf_data_A = power terf_states
