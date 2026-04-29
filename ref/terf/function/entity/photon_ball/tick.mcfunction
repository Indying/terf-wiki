function terf:entity/photon_ball/move
execute at @s run tp @s ^ ^ ^0.1
execute at @s run function terf:entity/photon_ball/move
execute at @s run tp @s ^ ^ ^0.1
execute at @s run function terf:entity/photon_ball/move
execute at @s run tp @s ^ ^ ^0.1
execute at @s run function terf:entity/photon_ball/move
execute at @s run tp @s ^ ^ ^0.1
execute at @s run function terf:entity/photon_ball/move
execute at @s run tp @s ^ ^ ^0.1

playsound minecraft:item.book.put player @a[distance=0..] ~ ~ ~ 1 0
scoreboard players add @s terf_data_B 1