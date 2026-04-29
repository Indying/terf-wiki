execute if block ~ ~ ~ minecraft:iron_trapdoor[open=false] run return run function terf:require/open_iron_trapdoor
execute if block ~ ~ ~ minecraft:iron_trapdoor[open=true] run return run function terf:require/close_iron_trapdoor
execute positioned ~ ~-0.0625 ~ as @n[tag=terf_dark_prismarine_bit,distance=..0.1] at @s positioned ~ ~0.0625 ~ run return run function terf:entity/player/tool/prismarine_bit/break
scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches 1.. positioned ^ ^ ^0.2 run function terf:entity/player/tool/wrench/raycast
execute as @e[type=minecraft:marker,tag=terf_maintenance,distance=..0.2] at @s run function terf:entity/player/tool/wrench/as_maintenance
