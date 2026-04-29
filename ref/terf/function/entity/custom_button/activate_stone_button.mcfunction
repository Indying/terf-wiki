data modify storage terf:temp args set value {command:'function terf:require/turn_on_stone_button'}
data modify storage terf:temp args.x set from storage terf:temp temp.minecraft:stone_button[0].pos[0]
data modify storage terf:temp args.y set from storage terf:temp temp.minecraft:stone_button[0].pos[1]
data modify storage terf:temp args.z set from storage terf:temp temp.minecraft:stone_button[0].pos[2]
function datapipes_lib:require/run_at with storage terf:temp args

playsound minecraft:block.lever.click master @a[distance=0..] ~ ~ ~ 1 0.6