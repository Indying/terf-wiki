scoreboard players remove @s terf_data_A 1

#check ring
scoreboard players set hadron_ended terf_states 0
scoreboard players set length terf_states 0
scoreboard players set mode terf_states 0
scoreboard players set terminated terf_states 100000

setblock ^-2 ^1 ^ light[level=0]

tag @s add terf_currententity
execute positioned ^3 ^1 ^ rotated ~-90 ~ run function terf:entity/machines/hadron_collider/ring/raycast
tag @s remove terf_currententity

scoreboard players operation @s terf_data_C = length terf_states
execute if score @s terf_data_A matches 0 if score hadron_ended terf_states matches 1 positioned ^ ^1 ^ run function terf:entity/machines/hadron_collider/complete

#calculate max power storage
scoreboard players operation @s datapipes_lib_power_max = length terf_states
scoreboard players operation @s datapipes_lib_power_max *= 1600 terf_states

#visuals, sounds and advancements
advancement grant @p[distance=..10] only terf:hadron_collider

playsound terf:explosion.rocketfly master @a[distance=0..] ~ ~ ~ 1 0.61

particle minecraft:electric_spark ^ ^1.5 ^ 0 0 0 1 100
particle minecraft:firework ^ ^1 ^ 0 0 0 0 1
particle minecraft:firework ^ ^1.2 ^ 0 0 0 0 1
particle minecraft:firework ^ ^1.4 ^ 0 0 0 0 1
particle minecraft:firework ^.2 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^.4 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^.6 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^.8 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^1 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^1.2 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^1.4 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^1.6 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^1.8 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^2 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^2.2 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^2.4 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^2.6 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^2.8 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^3 ^1 ^ 0 0 0 0 1
particle minecraft:vault_connection ^ ^1.5 ^ 0 0 0 1 100 force
particle minecraft:gust ^ ^1 ^ 0 0 0 0 1 force

execute if score hadron_ended terf_states matches 0 run return fail
playsound minecraft:entity.wither.spawn master @a[distance=0..] ~ ~ ~ 1 0
playsound terf:explosion.rocketfly master @a[distance=0..] ~ ~ ~ 1 1.5

playsound terf:explosion.rocketfly master @a[distance=0..] ~ ~ ~ 1 0.4
playsound terf:explosion.rocketfly master @a[distance=0..] ~ ~ ~ 1 0.5
playsound terf:explosion.rocketfly master @a[distance=0..] ~ ~ ~ 1 0.6

particle minecraft:explosion ^ ^1 ^ 0 0 0 1 1
particle flash{color:[1,1,1,1]} ^ ^1 ^ 0 0 0 0 1 force

particle minecraft:firework ^-.2 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^-.4 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^-.6 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^-.8 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^-1 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^-1.2 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^-1.4 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^-1.6 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^-1.8 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^-2 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^-2.2 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^-2.4 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^-2.6 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^-2.8 ^1 ^ 0 0 0 0 1
particle minecraft:firework ^-3 ^1 ^ 0 0 0 0 1

#become unstable when too short
execute store result score temp terf_states run data get entity @s data.terf.stored_recipe.l
scoreboard players operation temp terf_states *= @s terf_data_D
execute if score temp terf_states <= length terf_states run return fail
scoreboard players add @a[distance=..15] terf_data_P 10

particle minecraft:campfire_signal_smoke ^ ^1 ^ ^100000000 ^ ^ 0.0000000001 0 force
particle minecraft:campfire_signal_smoke ^ ^1 ^ ^-100000000 ^ ^ 0.0000000001 0 force
particle minecraft:campfire_signal_smoke ^ ^1 ^ ^100000000 ^ ^ 0.0000000001 0 force
particle minecraft:campfire_signal_smoke ^ ^1 ^ ^-100000000 ^ ^ 0.0000000001 0 force
particle minecraft:campfire_signal_smoke ^ ^1 ^ ^100000000 ^ ^ 0.0000000001 0 force
particle minecraft:campfire_signal_smoke ^ ^1 ^ ^-100000000 ^ ^ 0.0000000001 0 force
particle minecraft:campfire_signal_smoke ^ ^1 ^ ^100000000 ^ ^ 0.0000000001 0 force
particle minecraft:campfire_signal_smoke ^ ^1 ^ ^-100000000 ^ ^ 0.0000000001 0 force

particle minecraft:gust_emitter_small ^ ^1 ^ 0 0 0 0 1 force

playsound minecraft:entity.wither.spawn master @a[distance=0..] ~ ~ ~ 1 0.9
playsound minecraft:entity.wither.spawn master @a[distance=0..] ~ ~ ~ 1 0.91
playsound minecraft:entity.wither.spawn master @a[distance=0..] ~ ~ ~ 1 0.92

scoreboard players set length terf_states 60
execute if predicate datapipes_lib:chances/5 run function terf:entity/machines/hadron_collider/ring/explosion
execute if predicate datapipes_lib:chances/90 run scoreboard players add @s terf_data_A 1
