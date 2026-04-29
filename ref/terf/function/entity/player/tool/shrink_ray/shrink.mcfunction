playsound minecraft:entity.zombie_villager.converted player @a[distance=0..] ~ ~ ~ 0.7 1.9

data modify storage terf:temp args set value {command:'particle minecraft:ominous_spawning ~ ~ ~ ^ ^ ^50000000000 0.0000000001 0 force'}
execute store result storage terf:temp args.yaw float 1 run random value -10..10
execute store result storage terf:temp args.pitch float 1 run random value -10..10
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

tag @s add terf_currententity
execute if entity @s[x_rotation=89..90] run function terf:entity/player/tool/shrink_ray/scale_entity
execute positioned ^ ^ ^5 positioned ~-.5 ~-.5 ~-.5 as @e[tag=!terf_currententity,dx=0,dy=0,dz=0,type=!marker] unless score @s terf_data_C matches 1.. run function terf:entity/player/tool/shrink_ray/scale_entity
execute positioned ^ ^ ^4 positioned ~-.5 ~-.5 ~-.5 as @e[tag=!terf_currententity,dx=0,dy=0,dz=0,type=!marker] unless score @s terf_data_C matches 1.. run function terf:entity/player/tool/shrink_ray/scale_entity
execute positioned ^ ^ ^3 positioned ~-.5 ~-.5 ~-.5 as @e[tag=!terf_currententity,dx=0,dy=0,dz=0,type=!marker] unless score @s terf_data_C matches 1.. run function terf:entity/player/tool/shrink_ray/scale_entity
execute positioned ^ ^ ^2 positioned ~-.5 ~-.5 ~-.5 as @e[tag=!terf_currententity,dx=0,dy=0,dz=0,type=!marker] unless score @s terf_data_C matches 1.. run function terf:entity/player/tool/shrink_ray/scale_entity
execute positioned ^ ^ ^1 positioned ~-.5 ~-.5 ~-.5 as @e[tag=!terf_currententity,dx=0,dy=0,dz=0,type=!marker] unless score @s terf_data_C matches 1.. run function terf:entity/player/tool/shrink_ray/scale_entity
execute positioned ^ ^ ^0 positioned ~-.5 ~-.5 ~-.5 as @e[tag=!terf_currententity,dx=0,dy=0,dz=0,type=!marker] unless score @s terf_data_C matches 1.. run function terf:entity/player/tool/shrink_ray/scale_entity
tag @e remove terf_currententity