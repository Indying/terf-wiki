data modify storage terf:temp args set value {command:'execute positioned ^ ^ ^250 run function terf:entity/meteor/spawn_space'}
execute store result storage terf:temp args.yaw float 0.001 run random value -180000..180000
execute store result storage terf:temp args.pitch float 0.001 run random value -90000..0

data modify storage terf:temp args2 set value {arg1:'execute positioned ~',arg3:' ~',arg5:' ~',arg7:' run function datapipes_lib:require/run_rotated with storage terf:temp args'}
execute store result storage terf:temp args2.arg2 float 1 run random value -64..64
execute store result storage terf:temp args2.arg4 float 1 run random value -64..64
execute store result storage terf:temp args2.arg6 float 1 run random value -64..64
function datapipes_lib:require/with_args/7 with storage terf:temp args2
