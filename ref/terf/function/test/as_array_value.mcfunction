execute store result score temp terf_states run data get storage datapipes_lib:temp args.array[0].pos[1]
scoreboard players add temp terf_states 70

data modify storage terf:temp args.arg1 set value "execute store result storage terf:temp args.array["
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get index terf_states
data modify storage terf:temp args.arg3 set value "].pos[1] int 1 run scoreboard players get temp terf_states"

function datapipes_lib:require/with_args/3 with storage terf:temp args

scoreboard players add index terf_states 1
