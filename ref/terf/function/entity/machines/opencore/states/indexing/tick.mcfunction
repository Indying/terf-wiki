scoreboard players add @s terf_data_E 1

#sound
function terf:entity/machines/opencore/sound/magnet_hum

#visuals
function terf:entity/machines/opencore/visuals/electromagnet with entity @s data.terf.opencore

#damage players standing on nearby conductors
execute if score @s terf_data_E matches 22.. positioned ~.5 ~ ~.5 as @a[distance=..5] at @s if block ~ ~-0.1 ~ #terf:shocks run function terf:entity/machines/opencore/player_damage

#check for nearby items
execute if score @s terf_data_E matches 22.. unless data entity @s data.terf.stored_item run function terf:entity/machines/opencore/states/indexing/check_item with entity @s data.terf.opencore

#stop when out of power
execute if score @s[tag=!terf_oc_loading] datapipes_lib_power_storage matches ..0 run function terf:entity/machines/opencore/states/indexing/stop

#set scale of item display
data modify storage terf:temp args set value {arg1:"execute as @e[tag=terf_related_",arg3:"] run data merge entity @s {transformation:{scale:[0.6f,0.6f,0.6f]}}"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args
