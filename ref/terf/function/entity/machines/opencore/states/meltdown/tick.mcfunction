scoreboard players add @s terf_data_E 1

$execute positioned ~ ~4 ~ positioned ~.5 ~$(half_height) ~.5 run function terf:entity/machines/opencore/states/meltdown/core_visuals

function terf:entity/machines/opencore/visuals/coil_smoke with entity @s data.terf.opencore

playsound minecraft:block.bell.resonate master @a[distance=0..] ~ ~ ~ 8 0

execute if score @s terf_data_E matches 30 run playsound terf:alarms.alarm5 master @a[distance=0..] ~ ~ ~ 6 0.7

execute if score @s terf_data_E matches 20 run playsound terf:opencore.magnet_start master @a[distance=0..] ~ ~ ~ 8 2

execute if score @s terf_data_E matches 60 run playsound terf:opencore.unstable master @a[distance=0..] ~ ~ ~ 10
execute if score @s terf_data_E matches 60 run playsound terf:explosion.shieldboom master @a[distance=0..] ~ ~ ~ 10 1.5
execute if score @s terf_data_E matches 60 run scoreboard players add @a[distance=..50] terf_data_P 50
execute if score @s terf_data_E matches 60 run advancement grant @a[distance=..32] only terf:opencore/opencore_failure
execute if score @s terf_data_E matches 60 run stopsound @a[distance=..256] * terf:music.dimrain47_every_end
execute if score @s terf_data_E matches 60 run stopsound @a[distance=..256] * terf:music.dimrain47_every_end_remix

execute if score @s terf_data_E matches 70 run function terf:entity/machines/opencore/broadcast {level:3,text:'{"text":"!!!CRITICAL OPENCORE STABILIZATION FAILURE!!! ","color":"red"},{"text":"EVACUATE SECTOR B IMMEDIATELY!","color":"dark_red"}'}

execute if score @s terf_data_E matches 710.. run function terf:entity/machines/opencore/states/meltdown/complete with entity @s data.terf.opencore

scoreboard players set temp terf_states 830
scoreboard players operation temp terf_states -= @s terf_data_E
scoreboard players operation temp terf_states /= 20 terf_states
execute if score temp terf_states matches ..0 run scoreboard players set temp terf_states 1

scoreboard players set opacity terf_states 1500
scoreboard players operation opacity terf_states /= temp terf_states

scoreboard players set temp terf_states 460
scoreboard players operation temp terf_states -= @s terf_data_E
scoreboard players operation temp terf_states /= 8 terf_states

execute if predicate datapipes_lib:chances/50 run scoreboard players add opacity terf_states 7
execute if predicate datapipes_lib:chances/50 run scoreboard players add opacity terf_states 7
execute if predicate datapipes_lib:chances/50 run scoreboard players add opacity terf_states 7
execute if predicate datapipes_lib:chances/50 run scoreboard players add opacity terf_states 7
execute if score opacity terf_states matches 255.. run scoreboard players set opacity terf_states 255

execute if predicate datapipes_lib:chances/50 run scoreboard players remove opacity terf_states 7
execute if predicate datapipes_lib:chances/50 run scoreboard players remove opacity terf_states 7
execute if predicate datapipes_lib:chances/50 run scoreboard players remove opacity terf_states 7
execute if predicate datapipes_lib:chances/50 run scoreboard players remove opacity terf_states 7

execute if score opacity terf_states matches ..9 run scoreboard players set opacity terf_states 10

data modify storage terf:temp args set value {arg1:"execute as @e[tag=terf_related_",arg3:"] store result entity @s text_opacity int 1 run scoreboard players get opacity terf_states"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

#apply screenshake
scoreboard players remove opacity terf_states 40
scoreboard players operation opacity terf_states /= 3 terf_states
execute as @a[distance=..50] if score @s terf_data_P < opacity terf_states run scoreboard players operation @s terf_data_P = opacity terf_states
