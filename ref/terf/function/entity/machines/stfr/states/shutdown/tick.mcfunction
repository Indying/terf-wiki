#override control panel text
data modify storage terf:temp displays.group_main[1].messages[1] set value {"text":"normal","color":"green"}
data modify storage terf:temp displays.group_core[0].messages[0] set value {"text":". Stopping .",screen_color:"pink"}

scoreboard players add @s terf_data_E 1
execute if score @s terf_data_E matches ..240 run function terf:entity/machines/stfr/calculations/tick

#process visuals for this state
scoreboard players add @s terf_data_V 100
execute if score @s terf_data_E matches ..445 run function terf:entity/machines/stfr/visuals/core/tick
execute if score @s terf_data_E matches ..445 run function terf:entity/machines/stfr/visuals/shield/tick
execute if score @s terf_data_E matches ..465 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_E matches ..445 run function terf:entity/machines/stfr/visuals/stabilizer/stabilizer_shield_beam_tick
execute if score @s terf_data_E matches ..240 run function terf:entity/machines/stfr/visuals/stabilizer/stabilizer_power_beam_tick
execute if score @s terf_data_E matches ..465 run function terf:entity/machines/stfr/visuals/stabilizer/rotation/rotate_stabilizers with entity @s data.terf

#process sounds for this state
function terf:entity/machines/stfr/sound/humming_tick
function terf:entity/machines/stfr/sound/system_noise_tick
execute if score @s terf_data_E matches 160 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.shutdown.stabilizing',level:0,text:'{"text":"Stabilizing Reactor Shield..."}'}
execute if score @s terf_data_E matches 160 run tag @s add terf_stfr_opshield
execute if score @s terf_data_E matches 240 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.shutdown.cooling',level:0,text:'{"text":"Cooling Inner Core To Safe Temperatures..."}'}
execute if score @s terf_data_E matches 245 run tag @s add terf_low_temp
execute if score @s terf_data_E matches 245 run tag @s add terf_low_temp_crit
execute if score @s terf_data_E matches 245.. run scoreboard players operation temp terf_states = core_temp_divided terf_states
execute if score @s terf_data_E matches 245.. run scoreboard players operation temp terf_states *= 30 terf_states
execute if score @s terf_data_E matches 245.. run scoreboard players operation @s terf_data_M -= temp terf_states
execute if score @s terf_data_E matches 245.. if score core_temp_divided terf_states matches 22.. run scoreboard players remove @s terf_data_M 1000
execute if score @s terf_data_M matches ..21999 run scoreboard players set @s terf_data_M 22000

execute if score @s terf_data_E matches 445 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.shutdown.stopping_shield',level:0,text:'{"text":"Shutting Down Reactor Shield..."}'}
execute if score @s terf_data_E matches 460 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.shutdown.breakers',level:0,text:'{"text":"Disconnecting System Breakers..."}'}
execute if score @s terf_data_E matches 465 run playsound terf:switch ambient @a[distance=0..] 121.59 -22.44 62.13 1000
execute if score @s[tag=terf_stab_pistons_breach] terf_data_E matches 470 run return run function terf:entity/machines/stfr/states/shutdown_failure/start with entity @s data.terf
execute if score @s terf_data_E matches 470 run function terf:entity/machines/stfr/states/shutdown/deactivate
execute if score @s terf_data_E matches 470..870 run particle minecraft:end_rod ~ ~ ~ 1.5 1.5 1.5 0 1 force
execute if score @s terf_data_E matches 500 run stopsound @a * terf:reactorsystemnoise
execute if score @s terf_data_E matches 570 run scoreboard players set shieldstatus reactor 0
execute if score @s[tag=!terf_case] terf_data_E matches 800 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.shutdown.vacuuming_fail',level:1,text:'{"text":"Containment Vessel Damage. Failed To Recover Remaining Fuel.","color":"red"}'}
execute if score @s[tag=terf_case] terf_data_E matches 800 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.shutdown.vacuuming',level:0,text:'{"text":"Vacuuming Reactor Containment Vessel To Recover Remaining Fuel..."}'}
execute if score @s[tag=terf_case] terf_data_E matches 810 run playsound terf:vacuumcleaner ambient @a[distance=0..] ~ ~ ~ 3 1
execute if score @s terf_data_E matches 860 run stopsound @a[distance=..128] * terf:reactorsystemnoise
execute if score @s terf_data_E matches 810 run tag @s add terf_fuel_crit
execute if score @s terf_data_E matches 810 run tag @s add terf_low_fuel

#open stabilizer maintenance trapdoors
execute if score @s terf_data_E matches 1100 run function terf:entity/machines/stfr/stab_transform/open_trapdoors/stab_s with entity @s data.terf
execute if score @s terf_data_E matches 1110 run function terf:entity/machines/stfr/stab_transform/open_trapdoors/stab_e with entity @s data.terf
execute if score @s terf_data_E matches 1105 run function terf:entity/machines/stfr/stab_transform/open_trapdoors/stab_n with entity @s data.terf
execute if score @s terf_data_E matches 1115 run function terf:entity/machines/stfr/stab_transform/open_trapdoors/stab_w with entity @s data.terf

execute if score @s terf_data_E matches 1120 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:0,text:'{"text":"Fusion Reactor Shutdown Sequence Complete!"}'}
execute if score @s terf_data_E matches 1140.. run scoreboard players set @s terf_data_A 0
execute if score @s terf_data_E matches 1140.. run tag @s remove terf_core_starting_alarm

execute if score @s terf_data_E matches 470.. if score @s terf_data_F matches 1.. run scoreboard players remove @s terf_data_F 1

execute if score @s terf_data_E matches 20..240 as @s[tag=terf_key_on] run function terf:entity/machines/stfr/states/shutdown/abort_manual
execute if score shield_stress terf_states matches 29.. if score @s terf_data_E matches ..240 run function terf:entity/machines/stfr/states/shutdown/abort_automatic