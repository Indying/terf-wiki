execute store result score @s terf_data_C run data get entity @s Pos[1] 2
scoreboard players remove @s terf_data_C 1
scoreboard players set terminated terf_states 0
scoreboard players set elevator_top terf_states 0
execute positioned ^ ^ ^1 run function terf:entity/machines/gear_elevator/go_to_rack_top
scoreboard players set @s terf_data_B 0
tag @s add terf_elevator