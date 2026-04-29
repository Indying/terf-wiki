tag @s add terf_indestructible
scoreboard players set @s terf_data_A 3
scoreboard players set @s terf_data_E 0

forceload add ~120 ~120 ~-120 ~-120

function terf:require/run_n_times {n:10,command:'playsound terf:explosion.huge_explosion ambient @a[distance=0..] ~ ~ ~ 1000 0'}
function terf:require/run_n_times {n:10,command:'playsound terf:explosion.huge_explosion ambient @a[distance=0..] ~ ~ ~ 1000 1'}
function terf:require/run_n_times {n:10,command:'playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 1000 1'}
function terf:require/run_n_times {n:10,command:'playsound terf:explosion.huge_explosion ambient @a[distance=0..] ~ ~ ~ 1000 2'}

data modify storage terf:temp args set value {arg1:"execute as @e[type=minecraft:text_display,tag=terf_warp_core_overheat_display,tag=terf_related_",arg3:"] run kill @s"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

stopsound @a[distance=..1024] * terf:alarms.civil_alert_siren_4