data modify storage terf:temp args set value {command:'function terf:entity/custom_button/at_dark_oak_button'}
data modify storage terf:temp args.x set from storage terf:temp temp.minecraft:dark_oak_button[0].pos[0]
data modify storage terf:temp args.y set from storage terf:temp temp.minecraft:dark_oak_button[0].pos[1]
data modify storage terf:temp args.z set from storage terf:temp temp.minecraft:dark_oak_button[0].pos[2]
function datapipes_lib:require/run_at with storage terf:temp args

playsound minecraft:block.wooden_button.click_on master @a[distance=0..] ~ ~ ~ 1 1