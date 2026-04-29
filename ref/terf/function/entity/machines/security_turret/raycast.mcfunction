scoreboard players remove temp terf_states 1
execute positioned ~ ~-1 ~ as @a[distance=..1] run function terf:entity/machines/security_turret/hit_player
execute if score temp2 terf_states matches 0 if score temp terf_states matches 1.. positioned ^ ^ ^1 if block ~ ~ ~ #terf:laser_can_go_through run function terf:entity/machines/security_turret/raycast
execute if score temp2 terf_states matches 1 run function terf:entity/machines/security_turret/raycast_confirmed