data modify storage terf:temp args set value {arg1:'summon minecraft:item_display ~ ~ ~ {interpolation_duration:20,brightness:{sky:15,block:15},Tags:["terf_warp_core_flash","terf_related_',arg3:'"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion"}},Rotation:[',arg5:'f,45f]}'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
execute store result storage terf:temp args.arg4 float 0.001 run random value -180000..180000

function datapipes_lib:require/with_args/5 with storage terf:temp args
