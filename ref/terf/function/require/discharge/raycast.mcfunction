execute if score length terf_states > distance terf_states run return fail
execute store result storage terf:temp args.yaw float 0.001 run random value -40000..40000
execute store result storage terf:temp args.pitch float 0.001 run random value -40000..40000
execute store result storage terf:temp args.adder int 1 run random value 500..5000
execute store result storage terf:temp args.offset float 0.001 run data get storage terf:temp args.adder
function terf:require/discharge/raycast_args with storage terf:temp args
