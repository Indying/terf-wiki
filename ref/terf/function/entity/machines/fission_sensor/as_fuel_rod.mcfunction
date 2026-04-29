execute if score @s terf_data_A > max_temp terf_states run scoreboard players operation max_temp terf_states = @s terf_data_A

scoreboard players add fuel_rod_count terf_states 1
scoreboard players operation average_temp terf_states += @s terf_data_A