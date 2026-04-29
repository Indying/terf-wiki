scoreboard players set on terf_states 0
data modify storage terf:temp args set value {command:'function terf:entity/custom_button/at_lever'}
data modify storage terf:temp args.x set from storage terf:temp temp.minecraft:lever[0].pos[0]
data modify storage terf:temp args.y set from storage terf:temp temp.minecraft:lever[0].pos[1]
data modify storage terf:temp args.z set from storage terf:temp temp.minecraft:lever[0].pos[2]
function datapipes_lib:require/run_at with storage terf:temp args

execute if score on terf_states matches 0 run playsound minecraft:block.lever.click master @a[distance=0..] ~ ~ ~ 1 0.6
execute on vehicle if score on terf_states matches 0 run return run data modify entity @s brightness set value {sky:2,block:2}
playsound minecraft:block.lever.click master @a[distance=0..] ~ ~ ~ 1 0.5
execute on vehicle run data modify entity @s brightness set value {sky:15,block:15}