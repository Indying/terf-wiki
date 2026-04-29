$execute facing $(x) $(y) $(z) positioned ^1 ^ ^.4 run tp @s ~ ~ ~
rotate @s ~10 ~1
scoreboard players add @s terf_data_A 1
execute if score @s terf_data_A matches 100.. run kill @s