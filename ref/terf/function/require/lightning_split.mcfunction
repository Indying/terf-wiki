scoreboard players remove max_splits terf_states 1
execute if score max_splits terf_states matches ..0 run return fail

data modify storage terf:temp args.command set value 'function terf:require/lightning with storage terf:temp args'
execute store result storage terf:temp args.yaw float 0.001 run random value -10000..10000
execute store result storage terf:temp args.pitch float 0.001 run random value -10000..10000
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

execute store result storage terf:temp args.yaw float 0.001 run random value -10000..10000
execute store result storage terf:temp args.pitch float 0.001 run random value -10000..10000
function datapipes_lib:require/run_rotated_relative with storage terf:temp args