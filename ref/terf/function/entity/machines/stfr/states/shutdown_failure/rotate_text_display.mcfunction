data modify storage terf:temp args set value {arg1:'data merge entity @s {start_interpolation:0,transformation:{left_rotation:{axis:[0.0f,0.0f,1.0f],angle:',arg3:'}}}'}
execute store result storage terf:temp args.arg2 float 0.01 run random value 1..10000
function datapipes_lib:require/with_args/3 with storage terf:temp args