execute if score alternate terf_states matches -1 run particle minecraft:electric_spark ^1.65 ^ ^
execute if score alternate terf_states matches -1 run particle minecraft:electric_spark ^1.65 ^ ^-0.1
execute if score alternate terf_states matches -1 run particle minecraft:electric_spark ^1.65 ^ ^-0.2
execute if score alternate terf_states matches -1 run particle minecraft:electric_spark ^1.65 ^ ^-0.3

execute if score alternate terf_states matches 1 run particle minecraft:electric_spark ^-1.65 ^ ^
execute if score alternate terf_states matches 1 run particle minecraft:electric_spark ^-1.65 ^ ^-0.1
execute if score alternate terf_states matches 1 run particle minecraft:electric_spark ^-1.65 ^ ^-0.2
execute if score alternate terf_states matches 1 run particle minecraft:electric_spark ^-1.65 ^ ^-0.3

execute unless block ~ ~ ~ air run scoreboard players set terminated terf_states 100000
scoreboard players add terminated terf_states 1
execute positioned ~-1 ~-1 ~-1 if entity @e[type=!item,type=!marker,type=!item_display,type=!block_display,dx=1,dy=1,dz=1] unless entity @a[tag=terf_currententity,limit=1,dx=1,dy=1,dz=1] run scoreboard players set terminated terf_states 100000

execute unless score terminated terf_states matches ..300 run function terf:entity/vehicle/mining_ship/laser_hit
execute if score terminated terf_states matches ..300 positioned ^ ^ ^0.4 run function terf:entity/vehicle/mining_ship/laser_raycast