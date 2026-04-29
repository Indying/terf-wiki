execute as @e[type=item_display,tag=terf_bullet_head] at @s run function terf:entity/vehicle/mrt/beam/head_tick

execute as @e[type=item_display,tag=terf_bullet] at @s run function terf:entity/vehicle/mrt/beam/tick

scoreboard players remove bullets_exists terf_states 1