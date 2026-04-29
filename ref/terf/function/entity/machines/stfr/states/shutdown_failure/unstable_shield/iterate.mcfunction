execute store result storage terf:temp args.yaw float 0.001 run random value 1..360000
execute store result storage terf:temp args.pitch float 0.001 run random value 1..90000
execute store result storage terf:temp args.dist float 0.013 run scoreboard players get core_scale terf_states
function terf:entity/machines/stfr/states/shutdown_failure/unstable_shield/args with storage terf:temp args

scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches 1.. run function terf:entity/machines/stfr/states/shutdown_failure/unstable_shield/iterate
