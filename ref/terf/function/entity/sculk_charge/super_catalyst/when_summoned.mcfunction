scoreboard players add currentcoreid terf_states 1
scoreboard players operation @s terf_scorelink = currentcoreid terf_states

data modify storage terf:temp args set value {arg1:"tag @s add terf_machineid_"}
execute store result storage terf:temp args.arg2 double 1 run scoreboard players get @s terf_scorelink
data modify entity @s data.terf.machine_id set from storage terf:temp args.arg2
function datapipes_lib:require/with_args/2 with storage terf:temp args

data modify entity @s data.terf.infected set value []