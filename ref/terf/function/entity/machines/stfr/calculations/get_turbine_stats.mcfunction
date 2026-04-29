scoreboard players add turbine_count terf_states 1
scoreboard players operation turbine_output terf_states += @s terf_data_A
execute if entity @s[tag=terf_turbinecase] run scoreboard players add working_turbines terf_states 1