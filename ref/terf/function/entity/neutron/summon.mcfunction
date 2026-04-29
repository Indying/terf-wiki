data modify storage terf:temp args set value {arg1:'summon minecraft:marker ~ ~ ~ {Rotation:[',arg3:'f,',arg5:'f],Tags:["terf_neutron","terf_radioactive","terf_currententity"],data:{terf:{nSpeed:0.3}}}'}
execute store result storage terf:temp args.arg2 float 0.1 run random value -1800..1800
execute store result storage terf:temp args.arg4 float 0.1 run random value -180..180
function datapipes_lib:require/with_args/5 with storage terf:temp args
data modify entity @n[type=minecraft:marker,tag=terf_currententity] data.terf.neutron set from storage terf:temp temp
tag @n[type=minecraft:marker,tag=terf_currententity] remove terf_currententity