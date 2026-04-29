#fail if port dosent have fuel
execute if score has_fuel terf_states matches 0 run return run scoreboard players set status terf_states 3

#fail if reactor is not in overload state
execute unless score @s terf_data_A matches 5 run return run scoreboard players set status terf_states 4

scoreboard players set status terf_states 5
