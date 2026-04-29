execute store result storage terf:temp args.x int 1 run random value -128..128
execute store result storage terf:temp args.z int 1 run random value -128..128
function datapipes_lib:require/run_relative with storage terf:temp args