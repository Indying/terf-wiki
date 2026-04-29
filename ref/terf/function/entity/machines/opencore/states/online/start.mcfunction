playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 2
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 1.9
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 1.8
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 1.7
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 1.6
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 1.5
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 1.4
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 1.3
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 1.2
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 1.1
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 1
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 0
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 0.9
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 0.8
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 0.7
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 0.6
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 0.5
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 0.4
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 0.3
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 0.2
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 0.1
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 10 0

stopsound @a[distance=..128] * terf:charge_up.mega_chargeup

scoreboard players set @s terf_data_E 0
scoreboard players set @s terf_data_D 4
scoreboard players set @s terf_data_I 0

$execute positioned ~ ~4 ~ run particle minecraft:firework ~.5 ~$(half_height) ~.5 0 0 0 1 1000 force

title @a[distance=..24] times 0 1 2
title @a[distance=..24] title "\ueff3"

data modify storage terf:temp args set value {arg1:"execute as @e[tag=terf_related_",arg3:",type=item_display] run kill @s"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args