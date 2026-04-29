scoreboard players remove terminated terf_states 1

particle flash{color:[1,1,1,1]} ~ ~ ~ 0 0 0 0 1 force
particle minecraft:explosion ~ ~ ~ 0 0 0 1 1 force
particle minecraft:end_rod ~ ~ ~ 0 0 0 0.1 10 force

particle minecraft:campfire_cosy_smoke ~ ~ ~ 0 0 0 0 1 force
particle minecraft:campfire_cosy_smoke ^ ^ ^0.5 0 0 0 0 1 force

execute unless block ~ ~ ~ #terf:laser_can_go_through run function terf:entity/vehicle/art/beam/hit_block
execute positioned ~-.5 ~-.5 ~-.5 as @e[type=!item,dx=0,dy=0,dz=0] if function terf:entity/vehicle/art/beam/can_be_hit run return run function terf:entity/vehicle/art/beam/hit_entity
execute if score terminated terf_states matches 1.. positioned ^ ^ ^1 run function terf:entity/vehicle/art/beam/power_raycast
