scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches ..-1 run return fail
execute if block ~ ~ ~ #terf:indestructible run return fail

#raycast loop
function terf:entity/player/tool/tau_cannon/raycast_args with storage terf:temp args2

execute positioned ^ ^ ^0.2 if block ~ ~ ~ #terf:laser_can_go_through run return run function terf:entity/player/tool/tau_cannon/raycast

#if in a block, go through it
execute unless block ~ ~ ~ #terf:laser_can_go_through positioned ^ ^ ^0.2 run return run function terf:entity/player/tool/tau_cannon/raycast_in_block

#detect angle
execute as 0010cd2c-0010-cd2d-0010-c8e10010cd37 run function terf:entity/player/tool/tau_cannon/raycast_get_rotation_data

execute unless block ~ ~-.2 ~ #terf:laser_can_go_through run return run function terf:entity/player/tool/tau_cannon/raycast_hit_y
execute unless block ~ ~.2 ~ #terf:laser_can_go_through run return run function terf:entity/player/tool/tau_cannon/raycast_hit_y

execute unless block ~.2 ~ ~ #terf:laser_can_go_through run return run function terf:entity/player/tool/tau_cannon/raycast_hit_x
execute unless block ~-.2 ~ ~ #terf:laser_can_go_through run return run function terf:entity/player/tool/tau_cannon/raycast_hit_x

execute unless block ~ ~ ~.2 #terf:laser_can_go_through run return run function terf:entity/player/tool/tau_cannon/raycast_hit_z
execute unless block ~ ~ ~-.2 #terf:laser_can_go_through run return run function terf:entity/player/tool/tau_cannon/raycast_hit_z
