#override control panel text
data modify storage terf:temp displays.group_main[1].messages[1] set value {"text":"⚠OUTR FAIL⚠","color":"dark_red"}
data modify storage terf:temp displays.group_core[].color set value "red"
data modify storage terf:temp displays.group_core[0].messages[3][1][].color set value "white"
execute if score @s terf_data_E matches 350.. run data modify storage terf:temp displays.group_core[0].messages[3][1][-1].color set value "blue"

function terf:autokick

scoreboard players set spin_slow_adder terf_states 60000
function terf:entity/machines/stfr/calculations/tick

execute unless score @s terf_data_Ab matches 5 run scoreboard players add @s terf_data_E 1

#process visuals for this state
scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players operation temp terf_states *= 27 terf_states

scoreboard players set @s terf_data_B 100000
scoreboard players operation @s terf_data_B -= temp terf_states
scoreboard players operation @s terf_data_B /= 10 terf_states

scoreboard players add @s terf_data_V 500
data modify storage terf:temp displays.group_main[].color set value "red"
function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step

execute if score @s terf_data_E matches 351.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_E matches 351.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_E matches 351.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step

function terf:entity/machines/stfr/visuals/stabilizer/rotation/rotate_stabilizers with entity @s data.terf
tag @s add terf_stfr_opshield

scoreboard players set core_scale terf_states 200
execute if score @s terf_data_E matches 340.. run function terf:entity/machines/stfr/visuals/shield/tick
execute if score @s terf_data_E matches 340.. run function terf:entity/machines/stfr/visuals/stabilizer/stabilizer_shield_beam_tick

#process sounds for this state
function terf:entity/machines/stfr/sound/humming_tick
function terf:entity/machines/stfr/sound/system_noise_tick

execute unless score @s terf_data_E matches 350.. run particle minecraft:soul_fire_flame ~ ~ ~ 0.4 0.4 0.4 0.06 100 force
execute if score @s terf_data_E matches 350.. run particle minecraft:flame ~ ~ ~ 0.4 0.4 0.4 0.06 100 force

particle minecraft:large_smoke ~ ~ ~ 0.5 0.5 0.5 0.01 10 force
execute if score @s terf_data_E matches 340 run particle minecraft:end_rod ~ ~ ~ 1 1 1 1 100 force
execute unless score @s terf_data_E matches 340.. run particle flash{color:[1,1,1,1]} ~ ~ ~ 1 1 1 0 3 force
execute if score @s terf_data_E matches 340.. run particle flash{color:[1,1,1,1]} ~ ~ ~ 0 0 0 0 1 force
playsound minecraft:entity.zombie_villager.converted master @a[distance=0..] ~ ~ ~ 5 2
execute if score @s terf_data_M matches 25000000.. run scoreboard players remove @s terf_data_M 5216375
execute if score @s terf_data_P matches 13467430.. run scoreboard players remove @s terf_data_P 13467430
execute if score @s terf_data_P matches 1347430.. run scoreboard players remove @s terf_data_P 1347430

execute if score @s terf_data_E matches 10 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.manual_restab.attempt_aux_shield',level:1,text:'{"text":"Attempting To Form Auxilary Containment Shield!"}'}

execute if score @s terf_data_E matches 340 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.manual_restab.aux_shield_formed',level:1,text:'{"text":"Auxilary Containment Shield Formed! "},{"text":"Please Attempt The Following Tasks Before The Auxilary Shield Collapses:","color":"yellow"}'}
execute if score @s terf_data_E matches 350 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.manual_restab.disconnect_panel',level:1,text:'{"text":"Current Objective: ","color":"dark_aqua"},"Disconnect Control Panel Via. Mainframe To Bypass Security Measures"'}

execute if score @s terf_data_E matches 340 run particle minecraft:gust_emitter_large ~ ~ ~ 2 2 2 1 10

$execute if score @s terf_data_E matches 351.. if score @s terf_data_Ab matches 0 unless entity @e[type=marker,tag=terf_linked_to_$(machine_id),tag=terf_stfr_controller] run function terf:entity/machines/stfr/states/manual_restabilization/go_to_next_stage

execute if score @s terf_data_Ab matches 1.. run tag @s add terf_breaker_interested
execute if score @s terf_data_Ab matches 1 if score NETratetimer terf_states >= NETrate terf_states if score temp terf_states matches 0.. as @s[tag=terf_breakers_connected] run function terf:entity/machines/stfr/states/manual_restabilization/go_to_next_stage

$execute if score @s terf_data_Ab matches 2 if entity @e[type=marker,tag=terf_linked_to_$(machine_id),tag=terf_stfr_controller] run function terf:entity/machines/stfr/states/manual_restabilization/go_to_next_stage
tag @s remove terf_stfr_panel_connected
execute if data entity @s data.terf.mainframe_logistics.connected_machines.stfr_controller[0] run tag @s add terf_stfr_panel_connected

execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab6] run particle minecraft:poof ~ ~-10.5 ~ 0.7 0 0.7 0.03 10 force
execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab6] run particle minecraft:poof ~ ~-10.5 ~ 0.7 0 0.7 0.03 10 force

execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab5] run particle minecraft:poof ~-9.5 ~ ~ 0 0.7 0.7 0.03 10 force
execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab5] run particle minecraft:poof ~-8.5 ~ ~ 0 0.7 0.7 0.03 10 force

execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab4] run particle minecraft:poof ~ ~ ~-9.5 0.7 0.7 0 0.03 10 force
execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab4] run particle minecraft:poof ~ ~ ~-7.5 0.7 0.7 0 0.03 10 force

execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab3] run particle minecraft:poof ~9.5 ~ ~ 0 0.7 0.7 0.03 10 force
execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab3] run particle minecraft:poof ~7.5 ~ ~ 0 0.7 0.7 0.03 10 force

execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab2] run particle minecraft:poof ~ ~ ~9.5 0.7 0.7 0 0.03 10 force
execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab2] run particle minecraft:poof ~ ~ ~7.5 0.7 0.7 0 0.03 10 force

execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab1] run particle minecraft:poof ~ ~10.5 ~ 0.7 0 0.7 0.03 10 force
execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab1] run particle minecraft:poof ~ ~8.5 ~ 0.7 0 0.7 0.03 10 force

scoreboard players set stab_lenses terf_states 0
execute unless block ~5 ~ ~ minecraft:amethyst_block run scoreboard players add stab_lenses terf_states 1
execute unless block ~-5 ~ ~ minecraft:amethyst_block run scoreboard players add stab_lenses terf_states 1
execute unless block ~ ~5 ~ minecraft:amethyst_block run scoreboard players add stab_lenses terf_states 1
execute unless block ~ ~-5 ~ minecraft:amethyst_block run scoreboard players add stab_lenses terf_states 1
execute unless block ~ ~ ~5 minecraft:amethyst_block run scoreboard players add stab_lenses terf_states 1
execute unless block ~ ~ ~-5 minecraft:amethyst_block run scoreboard players add stab_lenses terf_states 1
execute if score @s terf_data_Ab matches 3 if score stab_lenses terf_states matches 6.. run function terf:entity/machines/stfr/states/manual_restabilization/go_to_next_stage

data modify storage terf:temp args set value {arg1:"execute as @e[type=minecraft:text_display,tag=terf_related_",arg3:",tag=terf_overload_flare,limit=2,sort=random] run function terf:entity/machines/stfr/states/overload/rotate_text_display"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
execute if score @s terf_data_E matches ..340 run function datapipes_lib:require/with_args/3 with storage terf:temp args

execute if score @s terf_data_E matches 340 run data modify storage terf:temp args set value {arg1:"execute as @e[type=minecraft:text_display,tag=terf_related_",arg3:",tag=terf_overload_flare] run data merge entity @s {transformation:{left_rotation:[0.0f,0.0f,0.0f,0.0f]}}"}
execute if score @s terf_data_E matches 340 run data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
execute if score @s terf_data_E matches 340 run function datapipes_lib:require/with_args/3 with storage terf:temp args

data modify storage terf:temp args set value {arg1:"kill @e[tag=terf_overload_flare,tag=terf_related_",arg3:"]"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
execute if score @s terf_data_E matches 400 run function datapipes_lib:require/with_args/3 with storage terf:temp args

execute if score @s[tag=terf_key_on,tag=terf_sstb_on] terf_data_Ab matches 4 if score working_stabs terf_states matches 2.. run function terf:entity/machines/stfr/states/manual_restabilization/activate

execute if score @s terf_data_Ab matches 5 run execute if score @s terf_data_B matches ..10000 run scoreboard players add @s terf_data_B 900
execute if score @s terf_data_Ab matches 5 if score @s terf_data_U matches 600.. run function terf:entity/machines/stfr/states/manual_restabilization/restabilize

execute if score @s terf_data_E matches 1300 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.manual_restab.fail_in_2m',level:2,text:'{"text":"Time Until Auxilary Shield Failure: T-2 minutes","color":"yellow"}'}
execute if score @s terf_data_E matches 2510 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.manual_restab.fail_in_60s',level:2,text:'{"text":"Time Until Auxilary Shield Failure: T-60s","color":"yellow"}'}
execute if score @s terf_data_E matches 3110 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.manual_restab.fail_in_30s',level:2,text:'{"text":"Time Until Auxilary Shield Failure: T-30s","color":"yellow"}'}
execute if score @s terf_data_E matches 3510 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.manual_restab.fail_in_10s',level:2,text:'{"text":"Time Until Auxilary Shield Failure: T-10s","color":"yellow"}'}
execute if score @s terf_data_E matches 3610 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:2,text:'{"text":"Time Until Auxilary Shield Failure: T-5s","color":"yellow"}'}

execute if score @s terf_data_E matches 3710.. run function terf:entity/machines/stfr/states/manual_restabilization/failure

