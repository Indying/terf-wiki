execute positioned ^ ^-1 ^2 if entity @e[type=minecraft:marker,tag=terf_currententity,distance=..0.6] run return run scoreboard players set hadron_ended terf_states 1
#execute positioned ^ ^ ^5 run function terf:entity/machines/hadron_collider/ring/raycast
