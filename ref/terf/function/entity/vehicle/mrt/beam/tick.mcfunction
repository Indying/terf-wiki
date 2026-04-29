scoreboard players add @s terf_data_A 1
execute if score @s terf_data_A matches 1 run return run tp @s ~ ~ ~
execute if score @s terf_data_A >= photon_beam_last terf_states run kill @s
