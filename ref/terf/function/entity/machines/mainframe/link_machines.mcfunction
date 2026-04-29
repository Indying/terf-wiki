#temp: machine id
#temp2: id of the machine to link

#set link of temp
data modify storage terf:temp args set value {arg1:"execute as @e[type=minecraft:marker,tag=terf_machineid_",arg3:"] run tag @s add terf_linked_to_"}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp terf_states
execute store result storage terf:temp args.arg4 int 1 run scoreboard players get temp2 terf_states
function datapipes_lib:require/with_args/4 with storage terf:temp args

#set link of temp2
data modify storage terf:temp args set value {arg1:"execute as @e[type=minecraft:marker,tag=terf_machineid_",arg3:"] run tag @s add terf_linked_to_"}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp2 terf_states
execute store result storage terf:temp args.arg4 int 1 run scoreboard players get temp terf_states
function datapipes_lib:require/with_args/4 with storage terf:temp args

