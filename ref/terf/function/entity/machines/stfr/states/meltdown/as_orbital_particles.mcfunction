scoreboard players add @s terf_data_A 1
execute if score @s terf_data_A matches 200.. run kill @s
tp @s ~ ~ ~ facing entity @n[type=marker,tag=terf_stfr]
execute unless block ~ ~1 ~ air run kill @s
setblock ~ ~ ~ fire keep
particle explosion ~ ~1 ~
particle minecraft:dust{color:[0.7,0.1,0.0],scale:4} ~ ~1 ~
