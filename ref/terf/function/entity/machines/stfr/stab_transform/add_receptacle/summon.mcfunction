$data modify storage terf:temp args set value {rid:$(rid),yaw:$(yaw),pitch:$(pitch)}
data modify storage terf:temp args.machine_id set from entity @s data.terf.machine_id
function terf:entity/machines/stfr/stab_transform/add_receptacle/summon_args with storage terf:temp args
setblock ~ ~ ~ barrier