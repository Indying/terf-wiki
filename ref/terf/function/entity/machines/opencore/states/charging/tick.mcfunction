scoreboard players add @s terf_data_E 1

execute if score @s terf_data_E matches 422.. run function terf:entity/machines/opencore/visuals/stabilizer_beams

#sound
function terf:entity/machines/opencore/sound/magnet_hum

#visuals
data modify storage terf:temp args set value {arg1:"particle minecraft:sculk_charge 1 ~.5 ~6 ~.5 0 0 0 ",arg3:" "}
execute store result storage terf:temp args.arg2 double 0.0005 run scoreboard players get @s terf_data_E
execute store result storage terf:temp args.arg4 int 0.1 run scoreboard players get @s terf_data_E
function datapipes_lib:require/with_args/4 with storage terf:temp args

function terf:entity/machines/opencore/visuals/electromagnet with entity @s data.terf.opencore

scoreboard players set temp terf_states 530
scoreboard players operation temp terf_states -= @s terf_data_E
scoreboard players operation temp terf_states /= 10 terf_states
execute if score temp terf_states matches ..0 run scoreboard players set temp terf_states 1

scoreboard players set opacity terf_states 1300
scoreboard players operation opacity terf_states /= temp terf_states

scoreboard players set temp terf_states 460
scoreboard players operation temp terf_states -= @s terf_data_E
scoreboard players operation temp terf_states /= 8 terf_states

scoreboard players add @s terf_data_F 1
execute if score @s terf_data_F > temp terf_states positioned ~.5 ~2 ~.5 run function datapipes_lib:require/run_in_all_directions {accuracy:10000,command:"particle end_rod ^ ^ ^0.8 0 0.7 0 1 0"}
execute if score @s terf_data_F > temp terf_states run scoreboard players set @s terf_data_F 0

execute if predicate datapipes_lib:chances/50 run scoreboard players remove opacity terf_states 1
execute if predicate datapipes_lib:chances/50 run scoreboard players remove opacity terf_states 1
execute if predicate datapipes_lib:chances/50 run scoreboard players remove opacity terf_states 1
execute if predicate datapipes_lib:chances/50 run scoreboard players remove opacity terf_states 1
execute if predicate datapipes_lib:chances/50 run scoreboard players add opacity terf_states 1
execute if predicate datapipes_lib:chances/50 run scoreboard players add opacity terf_states 1
execute if predicate datapipes_lib:chances/50 run scoreboard players add opacity terf_states 1
execute if predicate datapipes_lib:chances/50 run scoreboard players add opacity terf_states 1

execute if score opacity terf_states matches 255.. run scoreboard players set opacity terf_states 255
execute if score opacity terf_states matches ..9 run scoreboard players set opacity terf_states 10

data modify storage terf:temp args set value {arg1:"execute as @e[tag=terf_related_",arg3:"] store result entity @s text_opacity int 1 run scoreboard players get opacity terf_states"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

scoreboard players remove opacity terf_states 30
scoreboard players operation opacity terf_states /= 6 terf_states
scoreboard players operation @a[distance=..24] terf_data_P = opacity terf_states

#transition into online state
execute if score @s terf_data_E matches 475.. run function terf:entity/machines/opencore/states/online/start with entity @s data.terf.opencore

#damage players
execute positioned ~.5 ~ ~.5 as @a[distance=..5] at @s if block ~ ~-0.1 ~ #terf:shocks run function terf:entity/machines/opencore/player_damage
