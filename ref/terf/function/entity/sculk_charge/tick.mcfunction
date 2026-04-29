#terf_data_A = success rate
scoreboard players add @s terf_data_A 1

execute if predicate datapipes_lib:chances/50 run playsound minecraft:block.sculk.spread block @a[distance=0..] ~ ~ ~ 0.5
particle minecraft:sculk_soul ~ ~.5 ~ 0.3 0 0.3 0 2

execute if block ~ ~ ~ minecraft:cyan_stained_glass_pane if block ~ ~1 ~ air run function terf:entity/sculk_charge/grow_crystal
execute if predicate datapipes_lib:chances/2 if entity @a[dx=2,dy=100,dz=2,gamemode=survival] if block ~ ~1 ~ air run setblock ~ ~1 ~ minecraft:cyan_stained_glass_pane
execute as @a[distance=..1.4] run function terf:entity/sculk_charge/infect_player

execute if predicate datapipes_lib:chances/0.1 unless entity @e[type=minecraft:marker,tag=terf_sculk_charge,distance=0.01..5] run function terf:entity/sculk_charge/summon
execute if predicate datapipes_lib:chances/2 as @e[type=minecraft:warden,distance=..10] run attribute @s minecraft:max_health base set 20

function terf:entity/sculk_charge/move
execute at @s unless block ~ ~ ~ #terf:sculk_resistant unless block ~ ~ ~ #terf:sculk_transmitter run function terf:entity/sculk_charge/infect_block

execute if score @s terf_data_A matches 20.. if predicate datapipes_lib:chances/1 run function terf:entity/sculk_charge/pop