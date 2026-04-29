scoreboard players remove terminated terf_states 1

particle minecraft:electric_spark
execute positioned ~-.5 ~-.5 ~-.5 as @e[type=!item,dx=0,dy=0,dz=0] if function terf:entity/vehicle/art/beam/can_be_hit run return run scoreboard players set temp terf_states 1
execute unless score terminated terf_states matches ..0 positioned ^ ^ ^1 run function terf:entity/vehicle/art/beam/radar_raycast