execute unless entity @e[type=minecraft:marker,tag=terf_fuel_rod,distance=..0.1] run return fail

scoreboard players operation temperature terf_states += @e[type=minecraft:marker,tag=terf_fuel_rod,distance=..0.1] terf_data_A

scoreboard players operation temp terf_states = temperature terf_states
scoreboard players operation temp terf_states %= 2 terf_states

scoreboard players operation temperature terf_states /= 2 terf_states
scoreboard players operation other_temperature terf_states = temperature terf_states
scoreboard players operation other_temperature terf_states += temp terf_states

scoreboard players operation @e[type=minecraft:marker,tag=terf_fuel_rod,distance=..0.1] terf_data_A = other_temperature terf_states
scoreboard players operation @s terf_data_A = temperature terf_states
