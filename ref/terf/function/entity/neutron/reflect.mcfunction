scoreboard players add @s terf_data_A 1
execute if score @s terf_data_A matches 10.. run return run kill @s

execute store result entity @s data.terf.nSpeed float 0.01 run data get entity @s data.terf.nSpeed 98
tp @s ~ ~ ~ ~180 ~
execute store result score rotation_y terf_states run data get entity @s Rotation[1] 100000
scoreboard players operation rotation_y terf_states /= -1 terf_states
execute store result entity @s Rotation[1] float 0.00001 run scoreboard players get rotation_y terf_states

execute at @s run function terf:entity/neutron/move with entity @s data.terf
