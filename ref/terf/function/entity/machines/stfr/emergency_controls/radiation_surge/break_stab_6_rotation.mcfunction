data modify storage terf:temp args set value {arg1:"execute as @e[type=minecraft:item_display,tag=terf_related_",arg3:",tag=terf_stab_6_rotor] run data merge entity @s {interpolation_duration:5,start_interpolation:0,transformation:{left_rotation:{axis:[0.0f,1.0f,0.0f],angle:64567.0}}}"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args
playsound minecraft:item.mace.smash_air ambient @a[distance=0..] ~ ~ ~ 3 0