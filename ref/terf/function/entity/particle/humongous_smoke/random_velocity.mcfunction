execute store result score temp terf_states run random value 1..20
scoreboard players operation @s terf_data_A += temp terf_states

execute store result score @s terf_data_X run random value -1200..1200
execute store result score @s terf_data_Y run random value -800..800
execute store result score @s terf_data_Z run random value -1200..1200
tag @s remove terf_random_vel