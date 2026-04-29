scoreboard players set succeeded terf_states 0
execute on passengers if entity @s[type=minecraft:player] run scoreboard players set succeeded terf_states 1
tag @s add terf_currententity
execute if score succeeded terf_states matches 0 on target run ride @s mount @n[type=minecraft:interaction,tag=terf_currententity]
tag @s remove terf_currententity
