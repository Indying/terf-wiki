scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches ..0 run return run scoreboard players set status terf_states 2

execute as @n[type=marker,tag=terf_stfr,distance=..1] at @s run return run function terf:entity/machines/stasis_laser/as_reactor
execute positioned ^1 ^-1 ^1 run function terf:entity/machines/stasis_laser/raycast