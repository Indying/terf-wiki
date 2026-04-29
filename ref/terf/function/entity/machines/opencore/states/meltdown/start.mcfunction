execute at @s run playsound terf:lightsswitch ambient @a[distance=0..] ~ ~ ~ 1 2
execute at @s run playsound terf:lightsswitch ambient @a[distance=0..] ~ ~ ~ 1 2
execute at @s run playsound terf:lightsswitch ambient @a[distance=0..] ~ ~ ~ 1 2
execute at @s run playsound terf:lightsswitch ambient @a[distance=0..] ~ ~ ~ 1 2
execute at @s run playsound terf:lightsswitch ambient @a[distance=0..] ~ ~ ~ 1 2
execute at @s run playsound terf:lightsswitch ambient @a[distance=0..] ~ ~ ~ 1 2

playsound terf:alarms.beep2 ambient @a[distance=0..] ~ ~ ~ 0.5 0.7

scoreboard players set @s terf_data_E 0
scoreboard players set @s terf_data_D 6
scoreboard players set @s datapipes_lib_power_max 696969696

data modify storage terf:temp args set value {arg1:"execute as @e[tag=terf_related_",arg3:'] run data modify entity @s text set value {"text":"\\ueef1"}'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args
