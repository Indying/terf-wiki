data modify storage terf:temp args set value {arg1:"summon item ~ ~ ~ {Item:",arg3:"}"}
data modify storage terf:temp args.arg2 set from entity @s item
function datapipes_lib:require/with_args/3 with storage terf:temp args
kill @s