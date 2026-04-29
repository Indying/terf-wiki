data modify storage terf:temp args set value {arg1:'summon minecraft:item_display ~ ~ ~ {transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},brightness:{sky:15,block:15},Tags:["terf_orbital_strike_particle","terf_related_',arg3:'"],item:{id:"minecraft:white_stained_glass"},interpolation_duration:100,Rotation:[',arg5:'f,0f]}'}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get @s terf_scorelink
execute store result storage terf:temp args.arg4 float 0.001 run random value 1..360000
function datapipes_lib:require/with_args/5 with storage terf:temp args
