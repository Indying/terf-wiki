data modify storage terf:temp args set value {arg1:'summon minecraft:text_display ~ ~ ~ {Rotation:[',arg3:'f,',arg5:'f],Tags:["terf_black_hole_beam","terf_black_hole"],teleport_duration:100,interpolation_duration:10,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,0f,1f]},text:"",background:0,alignment:center}'}
execute store result storage terf:temp args.arg2 float 0.01 run random value -18000..18000
execute store result storage terf:temp args.arg4 float 0.01 run random value -9000..9000
function datapipes_lib:require/with_args/5 with storage terf:temp args
