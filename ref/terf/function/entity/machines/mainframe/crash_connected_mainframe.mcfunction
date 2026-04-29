execute unless score @s terf_connected_mainframe = @s terf_connected_mainframe run return fail
data modify storage terf:temp args set value {arg1:'execute as @e[type=minecraft:marker,tag=terf_machineid_',arg3:'] unless score @s terf_data_G matches 1.. run scoreboard players set @s terf_data_G 1300'}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get @s terf_connected_mainframe
function datapipes_lib:require/with_args/3 with storage terf:temp args
