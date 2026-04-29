tag @s remove terf_stfr_surge_unabortable
tag @s remove terf_startup_overload_stabilizing

playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0

playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 15 1
playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 15 1
playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 15 1
playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 15 1

scoreboard players set @s terf_data_A 3

scoreboard objectives remove terf_shake_magnitude
scoreboard objectives remove terf_shake_frequency
scoreboard objectives add terf_shake_magnitude dummy
scoreboard objectives add terf_shake_frequency dummy

scoreboard players add @a[distance=..80] terf_data_P 20

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.restabilize',level:1,text:'{"text":"The Fusion Reactor Core Has Been Restabilized Succesfully!"}'}

data modify storage terf:temp args set value {arg1:'execute as @e[type=minecraft:item_display,tag=terf_stfr_so_beam,tag=terf_related_',arg3:'] run kill @s'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

data modify storage terf:temp args set value {arg1:'execute as @e[type=minecraft:marker,tag=terf_stfr_so_helper,tag=terf_related_',arg3:'] run kill @s'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

data modify storage terf:temp args set value {arg1:"execute as @e[type=minecraft:marker,tag=terf_related_",arg3:",tag=terf_overload_beam] run kill @s"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args
