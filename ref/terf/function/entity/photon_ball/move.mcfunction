execute store result score rotation_x terf_states run data get entity @s Rotation[0] 1000
execute store result score rotation_y terf_states run data get entity @s Rotation[1] 1000

execute unless block ~ ~0.1 ~ #terf:laser_can_go_through run function terf:entity/photon_ball/hit_u
execute unless block ~ ~-0.1 ~ #terf:laser_can_go_through run function terf:entity/photon_ball/hit_d
execute unless block ~ ~ ~0.1 #terf:laser_can_go_through run function terf:entity/photon_ball/hit_n
execute unless block ~ ~ ~-0.1 #terf:laser_can_go_through run function terf:entity/photon_ball/hit_s
execute unless block ~-0.1 ~ ~ #terf:laser_can_go_through run function terf:entity/photon_ball/hit_w
execute unless block ~0.1 ~ ~ #terf:laser_can_go_through run function terf:entity/photon_ball/hit_e

execute if score @s terf_data_A matches 40.. run function terf:entity/photon_ball/blow
execute if score @s terf_data_B matches 600.. run function terf:entity/photon_ball/blow

particle end_rod ~ ~ ~ 0 0 0 0 1 force
particle electric_spark ~ ~ ~ 0.01 0.01 0.01 0 1 force

execute if score @s terf_data_B matches 5.. positioned ~-.5 ~-.5 ~-.5 as @e[type=!item_display,type=!interaction,type=!block_display,type=!marker,type=!armor_stand,type=!item,dx=0,dy=0,dz=0] at @s unless score @s terf_data_C matches 1 unless predicate terf:has_slowness run function terf:entity/photon_ball/entity_hit

execute store result entity @s Rotation[0] float 0.001 run scoreboard players get rotation_x terf_states
execute store result entity @s Rotation[1] float 0.001 run scoreboard players get rotation_y terf_states