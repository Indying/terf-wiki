execute if block ~ ~ ~ #terf:air_and_water run particle minecraft:totem_of_undying ~ ~ ~ 0 0 0 1 10 force
execute if block ~ ~ ~ air unless entity @n[type=minecraft:marker,tag=terf_fuel_rod,distance=..6] run summon lightning_bolt
execute if block ~ ~ ~ air run particle minecraft:shriek{delay:0} ~ ~ ~ 10 10 10 0 10 force
execute if block ~ ~ ~ air run particle minecraft:sweep_attack
execute if block ~ ~ ~ minecraft:light_blue_glazed_terracotta if predicate datapipes_lib:chances/30 run return 69420