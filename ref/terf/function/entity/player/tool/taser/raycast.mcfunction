particle minecraft:electric_spark ~ ~ ~ 0.2 0.2 0.2 0.1 1 force
execute positioned ~-.5 ~-.5 ~-.5 as @e[type=!item_display,type=!text_display,type=!interaction,tag=!terf_currententity,dx=0,dy=0,dz=0] at @s run function terf:entity/player/tool/taser/shocked
scoreboard players remove temp terf_states 1
execute if score temp terf_states matches 1.. positioned ^ ^ ^.3 run function terf:entity/player/tool/taser/raycast