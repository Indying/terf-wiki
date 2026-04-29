scoreboard players add @s terf_data_E 1

#sound
function terf:entity/machines/opencore/sound/magnet_hum
execute as @s[tag=!terf_allsystemsworking] run function terf:entity/machines/opencore/sound/alarm_structure

#visuals
$execute positioned ~ ~4 ~ positioned ~.5 ~$(half_height) ~.5 run function terf:entity/machines/opencore/states/online/core_visuals
function terf:entity/machines/opencore/visuals/electromagnet with entity @s data.terf.opencore
function terf:entity/machines/opencore/visuals/stabilizer_beams

scoreboard players set opacity terf_states 40
execute if predicate datapipes_lib:chances/50 run scoreboard players remove opacity terf_states 3
execute if predicate datapipes_lib:chances/50 run scoreboard players remove opacity terf_states 3
execute if predicate datapipes_lib:chances/50 run scoreboard players remove opacity terf_states 3
execute if predicate datapipes_lib:chances/50 run scoreboard players remove opacity terf_states 3
execute if predicate datapipes_lib:chances/50 run scoreboard players add opacity terf_states 3
execute if predicate datapipes_lib:chances/50 run scoreboard players add opacity terf_states 3
execute if predicate datapipes_lib:chances/50 run scoreboard players add opacity terf_states 3
execute if predicate datapipes_lib:chances/50 run scoreboard players add opacity terf_states 3

data modify storage terf:temp args set value {arg1:"execute as @e[tag=terf_related_",arg3:"] store result entity @s text_opacity int 1 run scoreboard players get opacity terf_states"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

#destroy blocks
$execute positioned ~ ~4 ~ run fill ~ ~-1 ~ ~1 ~$(height) ~1 minecraft:light

#respect the laws of physics
execute unless entity @s[tag=!terf_topcoil,tag=!terf_bottomcoil] run scoreboard players operation @s terf_data_G += @s terf_data_B
execute unless entity @s[tag=!terf_topcoil,tag=!terf_bottomcoil] run scoreboard players operation @s terf_data_G -= @s terf_data_C
execute unless score @s terf_data_G matches -273.. run scoreboard players set @s terf_data_G -273

execute store result score temp terf_states run data get entity @s data.terf.stored_recipe.operations[0].time
execute if score @s terf_data_E > temp terf_states run function terf:entity/machines/opencore/states/online/phase_complete with entity @s data.terf.stored_recipe.operations[0]

#transition into meltdown state
execute if score working_stabs terf_states matches ..4 run function terf:entity/machines/opencore/states/meltdown/start_late

execute unless score @s datapipes_lib_power_storage matches 1.. run scoreboard players add @s terf_data_I 1
execute unless score @s datapipes_lib_power_storage matches 1.. run particle minecraft:flame ~.5 ~6 ~.5 0 0 0 0.2 1 force
execute unless score @s datapipes_lib_power_storage matches 1.. run playsound minecraft:block.sand.break master @a[distance=0..] ~ ~ ~ 2 0
execute if score @s terf_data_I matches 400.. run function terf:entity/machines/opencore/states/meltdown/start_late

#player damage
execute positioned ~ ~3 ~ run damage @a[distance=..3,limit=1,sort=random] 8 terf:reactor