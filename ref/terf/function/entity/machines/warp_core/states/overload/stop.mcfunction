scoreboard players set @s terf_data_A 0
scoreboard players set @s terf_data_E 0
tag @s remove terf_indestructible

data modify storage terf:temp args set value {arg1:"execute as @e[type=minecraft:text_display,tag=terf_warp_core_overheat_display,tag=terf_related_",arg3:"] run kill @s"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 10 0
playsound terf:charge_up.heavy_shutdown master @a[distance=0..] ~ ~ ~ 10 2