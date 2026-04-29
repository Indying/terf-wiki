data modify storage terf:temp args set value {arg1:'execute if data storage terf:temp temp[{i:',arg3:'}] run scoreboard players set temp2 terf_states 1'}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get @s terf_scorelink
function datapipes_lib:require/with_args/3 with storage terf:temp args
