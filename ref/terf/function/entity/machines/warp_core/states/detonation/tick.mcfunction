scoreboard players add @s terf_data_E 1

execute if score @s terf_data_E matches ..3000 run function terf:entity/machines/warp_core/states/detonation/summon_flash

execute if score @s terf_data_E matches ..2900 run playsound minecraft:ambient.basalt_deltas.mood master @a[distance=0..] ~ ~ ~ 20 0

data modify storage terf:temp args set value {arg1:'execute as @e[type=minecraft:item_display,tag=terf_warp_core_flash,tag=terf_related_',arg3:'] run function terf:entity/machines/warp_core/states/detonation/as_flash'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args
execute if score @s terf_data_E matches ..3000 run function terf:require/run_n_times {n:128,command:'function terf:entity/machines/warp_core/states/detonation/raycast/random'}

execute if score @s terf_data_E matches ..3000 run title @a[tag=!terf_epilepsy_mode,distance=..200] times 20 0 100
execute if score @s terf_data_E matches ..3000 run title @a[tag=!terf_epilepsy_mode,distance=..200] title "\ueff4"

execute if score @s terf_data_E matches ..3100 run return fail
forceload remove ~120 ~120 ~-120 ~-120
function terf:entity/machines/multiblock_core_kill