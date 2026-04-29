execute store result score temp terf_states run random value 1..4

execute if score temp terf_states matches 1 run setblock ^2 ^1 ^ air
execute if score temp terf_states matches 1 run setblock ^1 ^2 ^ air
execute if score temp terf_states matches 1 run particle minecraft:poof ^1 ^1 ^ 0 0 0 2 10000 force

execute if score temp terf_states matches 2 run setblock ^2 ^-1 ^ air
execute if score temp terf_states matches 2 run setblock ^1 ^-2 ^ air
execute if score temp terf_states matches 2 run particle minecraft:poof ^1 ^-1 ^ 0 0 0 2 10000 force

execute if score temp terf_states matches 3 run setblock ^-2 ^1 ^ air
execute if score temp terf_states matches 3 run setblock ^-1 ^2 ^ air
execute if score temp terf_states matches 3 run particle minecraft:poof ^-1 ^1 ^ 0 0 0 2 10000 force

execute if score temp terf_states matches 4 run setblock ^-2 ^-1 ^ air
execute if score temp terf_states matches 4 run setblock ^-1 ^-2 ^ air
execute if score temp terf_states matches 4 run particle minecraft:poof ^-1 ^-1 ^ 0 0 0 2 10000 force

setblock ^ ^1 ^ air
setblock ^ ^-1 ^ air
setblock ^1 ^ ^ air
setblock ^-1 ^ ^ air

playsound terf:explosion.bang2 ambient @a[distance=0..] ~ ~ ~ 8 0
playsound terf:explosion.bang2 ambient @a[distance=0..] ~ ~ ~ 7.5 0.2
playsound terf:explosion.bang2 ambient @a[distance=0..] ~ ~ ~ 7 0.4
playsound terf:explosion.bang2 ambient @a[distance=0..] ~ ~ ~ 6.5 0.6
playsound terf:explosion.bang2 ambient @a[distance=0..] ~ ~ ~ 6 0.8
playsound terf:explosion.bang2 ambient @a[distance=0..] ~ ~ ~ 5.5 1
playsound terf:explosion.bang2 ambient @a[distance=0..] ~ ~ ~ 5 1.2
playsound terf:explosion.bang2 ambient @a[distance=0..] ~ ~ ~ 4.5 1.4
playsound terf:explosion.bang2 ambient @a[distance=0..] ~ ~ ~ 4 1.6
playsound terf:explosion.bang2 ambient @a[distance=0..] ~ ~ ~ 3.5 1.8
playsound terf:explosion.bang2 ambient @a[distance=0..] ~ ~ ~ 3 2

playsound terf:metal_pipe ambient @a[distance=0..] ~ ~ ~ 8 0

playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 7 2
playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 7 2

execute as @a[distance=..80] at @s run function terf:require/ceiling_dust/start
execute as @a[distance=..10] run damage @s 40 minecraft:explosion at ~ ~ ~

execute as @a[distance=..20] at @s run rotate @s ~ ~-30
scoreboard players add @a[distance=..60] terf_data_P 30
