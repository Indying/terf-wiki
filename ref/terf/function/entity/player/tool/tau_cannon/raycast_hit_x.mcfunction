execute if score rotation_x terf_states matches 60000..120000 if score rotation_y terf_states matches -30000..30000 positioned ^ ^ ^.1 run return run function terf:entity/player/tool/tau_cannon/raycast_enter_block
execute if score rotation_x terf_states matches -120000..-60000 if score rotation_y terf_states matches -30000..30000 positioned ^ ^ ^.1 run return run function terf:entity/player/tool/tau_cannon/raycast_enter_block

scoreboard players operation rotation_x terf_states /= -1 terf_states

execute store result storage terf:temp args.y float 0.001 run scoreboard players get rotation_y terf_states
execute store result storage terf:temp args.x float 0.001 run scoreboard players get rotation_x terf_states
function terf:entity/player/tool/tau_cannon/raycast_angle with storage terf:temp args