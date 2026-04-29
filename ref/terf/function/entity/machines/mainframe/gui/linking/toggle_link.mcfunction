advancement grant @p[distance=..32] only terf:mainframe

#get the id of the output machine from the mainframes stored data
data modify storage terf:temp args set value {arg1:"execute store result score temp terf_states run data get entity @s data.terf.mainframe.output_machines[",arg3:"]"}
execute store result storage terf:temp args.arg2 float 1 run scoreboard players get @s terf_data_C
function datapipes_lib:require/with_args/3 with storage terf:temp args

#get the id of the input machine from the mainframes stored data
data modify storage terf:temp args merge value {arg1:"execute store result score temp2 terf_states run data get entity @s data.terf.mainframe.input_machines[",arg3:"]"}
execute store result storage terf:temp args.arg2 float 1 run scoreboard players get @s terf_data_E
function datapipes_lib:require/with_args/3 with storage terf:temp args

execute if function terf:entity/machines/mainframe/are_machines_linked run return run function terf:entity/machines/mainframe/unlink_machines
function terf:entity/machines/mainframe/link_machines
