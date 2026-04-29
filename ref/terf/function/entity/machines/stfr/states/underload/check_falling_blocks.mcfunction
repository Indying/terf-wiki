execute store result score x terf_states run data get entity @s Pos[0] 100
execute store result score y terf_states run data get entity @s Pos[1] 100
execute store result score z terf_states run data get entity @s Pos[2] 100

execute store result storage terf:temp args.x double 0.01 run scoreboard players get x terf_states
execute store result storage terf:temp args.y double 0.01 run scoreboard players get y terf_states
execute store result storage terf:temp args.z double 0.01 run scoreboard players get z terf_states

execute as @e[type=falling_block,distance=..30,sort=random,limit=4] at @s run function terf:entity/machines/stfr/states/underload/attract with storage terf:temp args