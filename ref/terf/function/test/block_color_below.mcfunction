loot replace entity 0010ccd2-0010-cd37-0010-cd360010c8e1 container.0 mine ~ ~-0.1 ~ netherite_pickaxe[enchantments={silk_touch:1}]

data modify storage terf:temp args set value {arg1:'data modify storage terf:temp temp set from storage terf:constants block_colors.'}
data modify storage terf:temp args.arg2 set string entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.id 10
function datapipes_lib:require/with_args/2 with storage terf:temp args

data modify storage terf:temp args set value {arg1:'particle minecraft:dust{color:[', arg3:'f,', arg5:'f,', arg7:'f],scale:1} ~ ~ ~ 0 0 0 0 1 force'}
execute store result storage terf:temp args.arg2 float 0.0039215686274509803921568627451 run data get storage terf:temp temp[0]
execute store result storage terf:temp args.arg4 float 0.0039215686274509803921568627451 run data get storage terf:temp temp[1]
execute store result storage terf:temp args.arg6 float 0.0039215686274509803921568627451 run data get storage terf:temp temp[2]
function datapipes_lib:require/with_args/7 with storage terf:temp args