execute store result storage terf:temp args.yaw float 0.001 run random value 1..360000
execute store result storage terf:temp args.pitch float 0.001 run random value -90000..-70000
function terf:entity/machines/mcfr/detonation/raycast_start with storage terf:temp args

scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches 1.. run function terf:entity/machines/mcfr/detonation/raycast_start_iterate