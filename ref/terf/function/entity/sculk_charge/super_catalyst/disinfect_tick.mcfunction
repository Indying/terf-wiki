particle minecraft:ominous_spawning ~ ~ ~ 0.2 0.2 0.2 10 5 force

data modify storage terf:temp temp set from entity @s data.terf.infected[-1]

data modify storage terf:temp args.x set from storage terf:temp temp[0]
data modify storage terf:temp args.y set from storage terf:temp temp[1]
data modify storage terf:temp args.z set from storage terf:temp temp[2]

data modify storage terf:temp args.command set value 'function terf:entity/sculk_charge/super_catalyst/disinfect_block with storage terf:temp args'
function datapipes_lib:require/run_at with storage terf:temp args

data remove entity @s data.terf.infected[-1]