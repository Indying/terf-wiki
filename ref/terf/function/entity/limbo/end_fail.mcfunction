execute as @e[tag=terf_limbo,distance=..4] run kill @s

particle minecraft:firework ~ ~ ~ 1 1 1 1 2000 force
particle minecraft:lava ~ ~ ~ .5 .5 .5 1 100 force

scoreboard players set @a[distance=..96] terf_data_P 50
execute as @a[distance=..20] at @s unless data entity @s RootVehicle run tp @s ~ ~ ~ ~ ~-30

playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 1 1
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 1.5 0.9
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 2 0.8
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 2.5 0.7
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 3 0.6
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 3.5 0.5
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 4 0.4
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 4.5 0.3
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 5 0.2
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 5.5 0.1
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 6 0