execute if score @s terf_data_D matches ..69999 run particle minecraft:smoke ^ ^1 ^ 0.5 0.5 0.5 0 1 force
execute if score @s terf_data_D matches 40000..69999 run particle minecraft:smoke ^ ^1 ^ 0.5 0.5 0.5 0 5 force
execute if score @s terf_data_D matches 50000.. run particle minecraft:large_smoke ^ ^1 ^ 0.5 0.5 0.5 0 1 force
execute if score @s terf_data_D matches 60000.. run particle minecraft:large_smoke ^ ^1 ^ 0.5 0.5 0.5 0 1 force
execute if score @s terf_data_D matches 70000.. run particle minecraft:large_smoke ^ ^1 ^ 0.5 0.5 0.5 0 4 force
execute if score @s terf_data_D matches 80000.. run particle minecraft:large_smoke ^ ^1 ^ 0.5 0.5 0.5 0 10 force
execute if score @s terf_data_D matches 90000.. run particle minecraft:campfire_cosy_smoke ^ ^1 ^ 0.5 0.5 0.5 0 1 force

execute if score @s terf_data_D matches 100000.. if predicate datapipes_lib:chances/10 run playsound minecraft:entity.breeze.hurt ambient @a[distance=0..] ~ ~ ~ 1 0
execute if score @s terf_data_D matches 100000.. run particle minecraft:flame ^ ^1 ^-2 0.6 0.6 0.6 0.05 200 force
execute if score @s terf_data_D matches 100000.. run data modify storage terf:temp temp set from entity @s Rotation
execute if score @s terf_data_D matches 100000.. on passengers as @s[type=area_effect_cloud] on passengers on passengers at @s run function terf:entity/vehicle/mining_ship/as_item_display

