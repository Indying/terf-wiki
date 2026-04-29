scoreboard players add @a[distance=..10] terf_data_P 5
scoreboard players add @a[distance=..20] terf_data_P 5
scoreboard players add @a[distance=..30] terf_data_P 5
scoreboard players add @a[distance=..40] terf_data_P 5
scoreboard players add @a[distance=..50] terf_data_P 5
scoreboard players add @a[distance=..60] terf_data_P 5

execute as @a[distance=..20] at @s run rotate @s ~ ~-30

playsound terf:explosion.bang ambient @a[distance=0..] ~ ~ ~ 3 1
playsound terf:explosion.bang ambient @a[distance=0..] ~ ~ ~ 3.5 0.9
playsound terf:explosion.bang ambient @a[distance=0..] ~ ~ ~ 4 0.8
playsound terf:explosion.bang ambient @a[distance=0..] ~ ~ ~ 4.5 0.7
playsound terf:explosion.bang ambient @a[distance=0..] ~ ~ ~ 5 0.6
playsound terf:explosion.bang ambient @a[distance=0..] ~ ~ ~ 5.5 0.5
playsound terf:explosion.bang ambient @a[distance=0..] ~ ~ ~ 6 0.4
playsound terf:explosion.bang ambient @a[distance=0..] ~ ~ ~ 6.5 0.3
playsound terf:explosion.bang ambient @a[distance=0..] ~ ~ ~ 7 0.2
playsound terf:explosion.bang ambient @a[distance=0..] ~ ~ ~ 7.5 0.1
playsound terf:explosion.bang ambient @a[distance=0..] ~ ~ ~ 8 0

execute as @a[distance=..80] at @s run function terf:require/ceiling_dust/start
scoreboard players add @a[distance=..60] terf_data_P 30

playsound terf:metal_pipe ambient @a[distance=0..] ~ ~ ~ 8 0
playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 7 2
playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 7 2

particle minecraft:poof ^1 ^ ^ 0 0 0 2 1000 force
particle minecraft:poof ^-1 ^ ^ 0 0 0 2 1000 force
particle minecraft:poof ^ ^1 ^ 0 0 0 2 1000 force
particle minecraft:poof ^ ^-1 ^ 0 0 0 2 1000 force

particle minecraft:gust_emitter_large ~ ~ ~ 2 2 2 10 10 force
execute as @a facing entity @s eyes run function terf:entity/machines/turbine_large/explosion_raycast_start

fill ^1 ^2 ^2 ^1 ^2 ^-2 air destroy
fill ^-1 ^2 ^2 ^-1 ^2 ^-2 air destroy

fill ^1 ^-2 ^2 ^1 ^-2 ^-2 air destroy
fill ^-1 ^-2 ^2 ^-1 ^-2 ^-2 air destroy

fill ^-2 ^1 ^2 ^-2 ^1 ^-2 air destroy
fill ^-2 ^-1 ^2 ^-2 ^-1 ^-2 air destroy

fill ^2 ^1 ^2 ^2 ^1 ^-2 air destroy
fill ^2 ^-1 ^2 ^2 ^-1 ^-2 air destroy

setblock ^ ^2 ^2 air destroy
setblock ^ ^2 ^-2 air destroy

setblock ^ ^-2 ^2 air destroy
setblock ^ ^-2 ^-2 air destroy
setblock ^ ^-2 ^ air destroy

setblock ^2 ^ ^2 air destroy
setblock ^2 ^ ^-2 air destroy
setblock ^2 ^ ^ air destroy

setblock ^-2 ^ ^2 air destroy
setblock ^-2 ^ ^-2 air destroy
setblock ^-2 ^ ^ air destroy
