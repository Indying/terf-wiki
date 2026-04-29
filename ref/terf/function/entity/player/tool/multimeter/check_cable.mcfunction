scoreboard players set multimeter_block_in_sight terf_states 1
particle minecraft:electric_spark ~ ~ ~ 1 0 0 0 100 force
particle minecraft:electric_spark ~ ~ ~ 0 1 0 0 100 force
particle minecraft:electric_spark ~ ~ ~ 0 0 1 0 100 force
execute if entity @e[type=minecraft:marker,tag=terf_multimeter,distance=..0.1] run return fail

summon minecraft:marker ~ ~ ~ {Tags:["terf_multimeter","datapipes_lib_power_consumer"],data:{power:{checks:'if block ~ ~ ~ red_glazed_terracotta'}}}
scoreboard players set @e[type=marker,tag=terf_multimeter,distance=..0.01] datapipes_lib_power_max 2147483647

tellraw @s [{"text":"[Multimeter]","color":"green"},{"text":" Measuring...","color":"yellow"}]