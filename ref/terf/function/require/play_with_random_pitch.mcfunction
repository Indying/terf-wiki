$data modify storage terf:temp args set value {arg1:'playsound $(s) '}
$execute store result storage terf:temp args.arg2 float 0.0001 run random value $(min)..$(max)
function datapipes_lib:require/with_args/2 with storage terf:temp args