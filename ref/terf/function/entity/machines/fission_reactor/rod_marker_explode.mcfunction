particle minecraft:explosion ~ ~ ~ 0 0 0 0 1 force
particle minecraft:white_ash ~ ~ ~ 0.3 0.3 0.3 1 100 force
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 3 0.8
scoreboard players add @a[distance=..8] terf_data_N 91200

summon item ~ ~ ~ {Tags:["terf_currententity"],Item:{id:"minecraft:coal"}}
data modify entity @s data.terf.fission_fuel.count set value 9
data modify entity @n[tag=terf_currententity,type=item] Item set from entity @s data.terf.fission_fuel
tag @n[type=item] remove terf_currententity

execute as @a[distance=..8] run damage @s 5 terf:radiation at ~ ~ ~

kill @s