data modify storage terf:temp args set value {arg1:'summon minecraft:marker ~ ~ ~ {Rotation:[',arg3:'f,',arg5:'f],Tags:["terf_overload_beam","terf_related_',arg7:'"]}'}
execute store result storage terf:temp args.arg2 float 0.1 run random value -1800..1800
execute store result storage terf:temp args.arg4 float 0.1 run random value -900..900
data modify storage terf:temp args.arg6 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/7 with storage terf:temp args
