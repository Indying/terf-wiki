execute as @e[type=tnt,distance=..7] at @s run function terf:entity/sculk_charge/super_catalyst/as_tnt

execute unless block ~ ~4 ~ minecraft:cyan_stained_glass run particle minecraft:sculk_soul ~ ~1.5 ~ 0 1 0 1 0 force
execute unless block ~ ~4 ~ minecraft:cyan_stained_glass run particle minecraft:sculk_soul ~ ~1 ~ 0 1 0 1 0 force
execute if block ~ ~4 ~ minecraft:cyan_stained_glass run particle minecraft:sculk_soul ~ ~6.5 ~ 0 1 0 1 0 force
execute if block ~ ~4 ~ minecraft:cyan_stained_glass run particle minecraft:sculk_soul ~ ~6 ~ 0 1 0 1 0 force

execute if predicate datapipes_lib:chances/10 positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute unless block ~ ~ ~ minecraft:sculk_catalyst run function terf:entity/sculk_charge/super_catalyst/explode

execute as @e[type=minecraft:marker,tag=terf_sculk_charge,distance=2.5..5.5] unless entity @s[dy=10] at @s positioned ~ ~1 ~ if block ~ ~ ~ air run setblock ~ ~ ~ minecraft:cyan_stained_glass