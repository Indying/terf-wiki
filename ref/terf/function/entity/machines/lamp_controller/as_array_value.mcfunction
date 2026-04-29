data modify storage terf:temp args.x set from entity @s data.terf.buffer[0].pos[0]
data modify storage terf:temp args.y set from entity @s data.terf.buffer[0].pos[1]
data modify storage terf:temp args.z set from entity @s data.terf.buffer[0].pos[2]
data modify storage terf:temp args.command set value "execute if block ~ ~ ~ lever run function terf:entity/machines/lamp_controller/at_each_lever"
function datapipes_lib:require/run_at with storage terf:temp args

data remove entity @s data.terf.buffer[0]