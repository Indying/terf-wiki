tag @s remove terf_currententity
tag @s add terf_garbage_collector_flagged
playsound terf:alarms.alarm6 master @a[distance=0..] 0 0 0 100000 1
tellraw @a ["",{"text":"["},{"text":"S","color":"red"},{"text":"Y","color":"gold"},{"text":"S","color":"yellow"},{"text":"T","color":"green"},{"text":"E","color":"aqua"},{"text":"M","color":"green"},{"text":"] "},{"text":"The garbage collector has found a memory leak! Involved entities have been tagged with terf_garbage_collector_flagged. Please report this error!","color":"red"}]
tellraw @a "Additional details include:"

say Entity: @s

data modify storage terf:temp args set value {arg1:'tellraw @a "Machine id: ',arg3:'"'}
data modify storage terf:temp args.arg2 set value "unknown"
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

data modify storage terf:temp args set value {arg1:'tellraw @a "Machine name: ',arg3:'"'}
data modify storage terf:temp args.arg2 set value "unknown"
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_name
function datapipes_lib:require/with_args/3 with storage terf:temp args


data modify storage terf:temp args set value {arg1:'tellraw @a "First tags: ',arg13:'"'}
data modify storage terf:temp args.arg2 set value "unknown"
data modify storage terf:temp args.arg3 set value "unknown"
data modify storage terf:temp args.arg4 set value "unknown"
data modify storage terf:temp args.arg5 set value "unknown"
data modify storage terf:temp args.arg6 set value "unknown"
data modify storage terf:temp args.arg7 set value "unknown"
data modify storage terf:temp args.arg8 set value "unknown"
data modify storage terf:temp args.arg9 set value "unknown"
data modify storage terf:temp args.arg10 set value "unknown"
data modify storage terf:temp args.arg11 set value "unknown"
data modify storage terf:temp args.arg12 set value "unknown"

data modify storage terf:temp args.arg2 set from entity @s Tags[0]
data modify storage terf:temp args.arg3 set from entity @s Tags[1]
data modify storage terf:temp args.arg4 set from entity @s Tags[2]
data modify storage terf:temp args.arg5 set from entity @s Tags[3]
data modify storage terf:temp args.arg6 set from entity @s Tags[4]
data modify storage terf:temp args.arg7 set from entity @s Tags[5]
data modify storage terf:temp args.arg8 set from entity @s Tags[6]
data modify storage terf:temp args.arg9 set from entity @s Tags[7]
data modify storage terf:temp args.arg10 set from entity @s Tags[8]
data modify storage terf:temp args.arg11 set from entity @s Tags[9]
data modify storage terf:temp args.arg12 set from entity @s Tags[10]

function datapipes_lib:require/with_args/13 with storage terf:temp args

$say Attached Message: $(msg)