#temp: machine id
#temp2: id of the machine to check if its connected to it

scoreboard players set output terf_states 0

data modify storage terf:temp args merge value {arg1:"execute if entity @e[type=minecraft:marker,tag=terf_linked_to_",arg3:",tag=terf_machineid_",arg5:"] run scoreboard players set output terf_states 1"}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp terf_states
execute store result storage terf:temp args.arg4 int 1 run scoreboard players get temp2 terf_states
function datapipes_lib:require/with_args/5 with storage terf:temp args

execute if score output terf_states matches 1 run return 1