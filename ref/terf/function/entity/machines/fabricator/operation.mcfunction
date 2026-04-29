#terf_data_A = cooldown

scoreboard players remove @s datapipes_lib_power_storage 100
execute if score @s terf_data_A matches 156.. run particle smoke ^ ^.5 ^ 0.1 0 0.05 0 1 force
execute if score @s terf_data_A matches 148..228 run particle minecraft:falling_lava ^.2 ^1.3 ^.2 0 0.1 0 1 10 force
execute if score @s terf_data_A matches 148..228 run particle minecraft:falling_lava ^.2 ^1.3 ^-.2 0 0.1 0 1 10 force
execute if score @s terf_data_A matches 148..228 run particle minecraft:falling_lava ^-.2 ^1.3 ^.2 0 0.1 0 1 10 force
execute if score @s terf_data_A matches 148..228 run particle minecraft:falling_lava ^-.2 ^1.3 ^-.2 0 0.1 0 1 10 force
execute if score @s terf_data_A matches 84..124 run particle minecraft:electric_spark ^-1 ^3 ^ 0.1 0.3 0.1 0.1 1
execute if score @s terf_data_A matches 2 run playsound minecraft:entity.item_frame.rotate_item block @a[distance=0..] ~ ~ ~ 1 0
execute if score @s terf_data_A matches 2 run particle minecraft:large_smoke ^ ^.5 ^ 0 0 0 0.1 10 force
execute if score @s terf_data_A matches 2 run particle minecraft:dripping_lava ^-1.2 ^.5 ^-.2
execute if score @s terf_data_A matches 4 run playsound minecraft:entity.item_frame.rotate_item block @a[distance=0..] ~ ~ ~ 1 0
execute if score @s terf_data_A matches 4 run particle minecraft:large_smoke ^ ^.5 ^ 0 0 0 0.1 10 force
execute if score @s terf_data_A matches 4 run particle minecraft:dripping_lava ^-1 ^.5 ^-.2
execute if score @s terf_data_A matches 6 run playsound minecraft:entity.item_frame.rotate_item block @a[distance=0..] ~ ~ ~ 1 0
execute if score @s terf_data_A matches 6 run particle minecraft:large_smoke ^ ^.5 ^ 0 0 0 0.1 10 force
execute if score @s terf_data_A matches 6 run particle minecraft:dripping_lava ^-.8 ^1.5 ^-.2
execute if score @s terf_data_A matches 10 run playsound minecraft:entity.item_frame.rotate_item block @a[distance=0..] ~ ~ ~ 1 0
execute if score @s terf_data_A matches 10 run particle minecraft:large_smoke ^ ^.5 ^ 0 0 0 0.1 10 force
execute if score @s terf_data_A matches 10 run particle minecraft:dripping_lava ^-1.2 ^.5 ^
execute if score @s terf_data_A matches 14 run playsound minecraft:entity.item_frame.rotate_item block @a[distance=0..] ~ ~ ~ 1 0
execute if score @s terf_data_A matches 14 run particle minecraft:large_smoke ^ ^.5 ^ 0 0 0 0.1 10 force
execute if score @s terf_data_A matches 14 run particle minecraft:dripping_lava ^-1 ^.5 ^
execute if score @s terf_data_A matches 20 run playsound minecraft:entity.item_frame.rotate_item block @a[distance=0..] ~ ~ ~ 1 0
execute if score @s terf_data_A matches 20 run particle minecraft:large_smoke ^ ^.5 ^ 0 0 0 0.1 10 force
execute if score @s terf_data_A matches 20 run particle minecraft:dripping_lava ^-.8 ^.5 ^
execute if score @s terf_data_A matches 26 run playsound minecraft:entity.item_frame.rotate_item block @a[distance=0..] ~ ~ ~ 1 0
execute if score @s terf_data_A matches 26 run particle minecraft:large_smoke ^ ^.5 ^ 0 0 0 0.1 10 force
execute if score @s terf_data_A matches 26 run particle minecraft:dripping_lava ^-1.1 ^.5 ^.1
execute if score @s terf_data_A matches 34 run playsound minecraft:entity.item_frame.rotate_item block @a[distance=0..] ~ ~ ~ 1 0
execute if score @s terf_data_A matches 34 run particle minecraft:large_smoke ^ ^.5 ^ 0 0 0 0.1 10 force
execute if score @s terf_data_A matches 34 run particle minecraft:dripping_lava ^-1 ^.5 ^.1
execute if score @s terf_data_A matches 50 run playsound minecraft:entity.item_frame.rotate_item block @a[distance=0..] ~ ~ ~ 1 0
execute if score @s terf_data_A matches 50 run particle minecraft:large_smoke ^ ^.5 ^ 0 0 0 0.1 10 force
execute if score @s terf_data_A matches 50 run particle minecraft:dripping_lava ^-.8 ^.5 ^.1
execute if score @s terf_data_A matches 84 run function terf:entity/machines/fabricator/expand_piston
execute if score @s terf_data_A matches 88 run function terf:entity/machines/fabricator/retract_piston
execute if score @s terf_data_A matches 92 run function terf:entity/machines/fabricator/expand_piston
execute if score @s terf_data_A matches 96 run function terf:entity/machines/fabricator/retract_piston
execute if score @s terf_data_A matches 100 run function terf:entity/machines/fabricator/expand_piston
execute if score @s terf_data_A matches 104 run function terf:entity/machines/fabricator/retract_piston
execute if score @s terf_data_A matches 108 run function terf:entity/machines/fabricator/expand_piston
execute if score @s terf_data_A matches 112 run function terf:entity/machines/fabricator/retract_piston
execute if score @s terf_data_A matches 116 run function terf:entity/machines/fabricator/expand_piston
execute if score @s terf_data_A matches 120 run function terf:entity/machines/fabricator/retract_piston
execute if score @s terf_data_A matches 124 run function terf:entity/machines/fabricator/expand_piston
execute if score @s terf_data_A matches 128 run function terf:entity/machines/fabricator/retract_piston
execute if score @s terf_data_A matches 140 run particle minecraft:smoke ^ ^.5 ^ 0.2 0 0.2 0 10 force
execute if score @s terf_data_A matches 140 run playsound minecraft:block.fire.extinguish block @a[distance=0..] ~ ~ ~ 1 0
scoreboard players add @s terf_data_A 1
execute unless score @s terf_data_A matches 341.. run return fail
execute positioned ^-1 ^.49 ^-1 if block ~ ~ ~ hopper run return run function terf:entity/machines/fabricator/complete with entity @s data.terf
execute positioned ~ ~.5 ~ run function terf:entity/machines/fabricator/complete with entity @s data.terf
