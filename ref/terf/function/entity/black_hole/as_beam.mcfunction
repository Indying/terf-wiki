data modify storage terf:temp args set value {arg1:'rotate @s ~',arg3:' ~'}
execute store result storage terf:temp args.arg2 float 0.01 run random value -1000..1000
execute store result storage terf:temp args.arg4 float 0.01 run random value -1000..1000
function datapipes_lib:require/with_args/4 with storage terf:temp args

data modify storage terf:temp args set value {arg1:'data merge entity @s {start_interpolation:0,transformation:{scale:[1f,',arg3:'f,1f]}}'}
execute store result storage terf:temp args.arg2 float 0.1 run random value -1000..1000
function datapipes_lib:require/with_args/3 with storage terf:temp args

execute if score interpolation_duration terf_states matches 10.. store result entity @s interpolation_duration int 1 run scoreboard players get interpolation_duration terf_states
