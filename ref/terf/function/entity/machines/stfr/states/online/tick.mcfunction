#process logistics
function terf:entity/machines/stfr/calculations/tick

#override control panel text
execute unless score shield_stress terf_states matches 100.. run data modify storage terf:temp displays.group_main[1].messages[1] set value {"text":"normal","color":"green"}
execute if score shield_intensity_divided terf_states matches ..75 run data modify storage terf:temp displays.group_main[1].messages[1] set value {"text":"!Low Intensity!","color":"yellow"}
execute if score shield_stress terf_states matches 100.. run data modify storage terf:temp displays.group_main[1].messages[1] set value {"text":"⚠DEGRADING⚠","color":"red"}

data modify storage terf:temp displays.group_core[0].messages[0] set value {"text":"Reactor Online",screen_color:"light_gray"}
data modify storage terf:temp displays.group_core[0].messages[3][1][].color set value "white"

#process visuals for this state
scoreboard players set core_scale terf_states 100
scoreboard players add @s terf_data_V 100

execute if score shield_stress terf_states matches 100.. if predicate datapipes_lib:chances/10 run particle minecraft:gust_emitter_small ~ ~ ~ 0 0 0 0 1 force
execute if score shield_stress terf_states matches 100.. if predicate datapipes_lib:chances/20 run playsound terf:braam master @a[distance=0..] ~ ~ ~ 4 0.7
particle minecraft:dust_plume ~ ~ ~ 0 0 0 0.2 1 force

function terf:entity/machines/stfr/visuals/core/tick
function terf:entity/machines/stfr/visuals/shield/tick
function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
function terf:entity/machines/stfr/visuals/stabilizer/stabilizer_shield_beam_tick
function terf:entity/machines/stfr/visuals/stabilizer/stabilizer_power_beam_tick
function terf:entity/machines/stfr/visuals/stabilizer/rotation/rotate_stabilizers with entity @s data.terf

#process sounds for this state
function terf:entity/machines/stfr/sound/humming_tick
function terf:entity/machines/stfr/sound/system_noise_tick

#transition into stabilizer loss state
execute if score working_stabs terf_states matches 0 if score shield_stress terf_states matches ..99 run function terf:entity/machines/stfr/states/stabilizer_loss/start

#transition into overload state
execute if score shield_intensity_divided terf_states matches ..0 unless score shield_collapse_stress terf_states matches 100.. if score working_stabs terf_states matches 1.. if score intensity_decrease terf_states matches 6.. run function terf:entity/machines/stfr/states/overload/start
execute if score shield_intensity_divided terf_states matches ..0 unless score shield_collapse_stress terf_states matches 100.. if score working_stabs terf_states matches 1.. if predicate datapipes_lib:chances/0.3 unless score intensity_decrease terf_states matches 6.. run function terf:entity/machines/stfr/states/overload/start
execute if score shield_intensity_divided terf_states matches ..0 unless score shield_collapse_stress terf_states matches 100.. unless score working_stabs terf_states matches 1.. run function terf:entity/machines/stfr/states/overload/start

#transition into reaction loss state
execute if score shield_intensity_divided terf_states matches ..0 if score shield_collapse_stress terf_states matches 100.. if predicate datapipes_lib:chances/0.3 run function terf:entity/machines/stfr/states/reaction_loss/shield_collapse

#radiation
scoreboard players add @a[distance=..8] terf_data_A 2

#maintenance & lubricant
scoreboard players set temp terf_states 0
$execute if score lubricant_amount terf_states matches 1.. run function terf:entity/machines/stfr/maintenance/as_lubricant_properties with storage terf:constants fluid_dictionary.$(id)
execute if score temp terf_states matches 0 unless score stfr_hardcore_mode terf_states matches 1 if predicate {"condition":"minecraft:random_chance","chance":0.0001} if entity @a[gamemode=!spectator,distance=..512] run function terf:entity/machines/stfr/maintenance/start_maintenance
execute if score temp terf_states matches 0 if score stfr_hardcore_mode terf_states matches 1 if predicate {"condition":"minecraft:random_chance","chance":0.002} if entity @a[gamemode=!spectator,distance=..512] run function terf:entity/machines/stfr/maintenance/start_maintenance
