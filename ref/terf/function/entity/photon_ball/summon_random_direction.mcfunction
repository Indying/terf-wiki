data modify storage terf:temp args set value {arg1:'summon minecraft:marker ~ ~ ~ {Rotation:[',arg3:'f,',arg5:'f],Tags:["terf_photon_ball"]}'}
execute store result storage terf:temp args.arg2 float 0.1 run random value -1800..1800
execute store result storage terf:temp args.arg4 float 0.1 run random value -900..900
function datapipes_lib:require/with_args/5 with storage terf:temp args
