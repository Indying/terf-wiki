scoreboard players add @s terf_data_E 1
function terf:autokick

#override control panel text
data modify storage terf:temp displays.group_main[1].messages[1] set value {"text":"⚠OUTR FAIL⚠","color":"dark_red"}
data modify storage terf:temp displays.group_core[0].messages[0] set value {"text":"⚠OVERLOAD⚠",screen_color:"red"}
data modify storage terf:temp displays.group_main[].color set value "red"
data modify storage terf:temp displays.group_core[0].messages[3][1][].color set value "white"
data modify storage terf:temp displays.group_core[0].messages[3][1][-1].color set value "red"
scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players operation temp terf_states %= 20 terf_states
execute if score temp terf_states matches 10.. run data modify storage terf:temp displays.group_core[0].messages[3][1][-2].color set value "yellow"

scoreboard players set spin_slow_adder terf_states 60000
function terf:entity/machines/stfr/calculations/tick

#process visuals for this state
function terf:entity/machines/stfr/visuals/stabilizer/stabilizer_power_beam_tick
function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
function terf:entity/machines/stfr/visuals/stabilizer/rotation/rotate_stabilizers with entity @s data.terf

#ramp up stabilizer rotor speed
scoreboard players add @s terf_data_V 100
scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players operation temp terf_states *= 2 terf_states
execute if score temp terf_states matches 501.. run scoreboard players set temp terf_states 500
scoreboard players operation @s terf_data_V += temp terf_states
execute if score @s terf_data_E matches ..250 run function terf:entity/machines/stfr/visuals/stabilizer/rotor_particles/steam_ejection

$execute if score @s terf_data_E matches 5 as @e[type=item_display,tag=terf_stfr_shield_explosion,tag=terf_related_$(machine_id),distance=..1] run function terf:entity/machines/stfr/states/overload/shield_explosion_beams/tick
$execute if score @s terf_data_E matches 105 run kill @e[type=item_display,tag=terf_stfr_shield_explosion,tag=terf_related_$(machine_id),distance=..1]

execute if score @s terf_data_E matches 20 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.overload.overdrive',level:3,text:'{"text":"Overdriving Stabilizers To Maintain Internal Shield Intensity...","color":"red"}'}

execute if score @s terf_data_E matches 320 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.overload.restab_options',level:1,text:'{"text":"Restabilization Options Found:","color":"gold"}'}
execute if score @s terf_data_E matches 321 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:0,text:'{"text":"- Stasis Laser Activation"}'}
execute if score @s[tag=!terf_manual_stabilization_failed] terf_data_E matches 321 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:0,text:'{"text":"- Replace 4 Stabilizer Lenses (Redstone Lamps) With Amethyst Blocks, Then Confirming Via. SSTB"}'}
 
execute if score @s terf_data_E matches 300.. run function terf:entity/machines/stfr/visuals/stabilizer/rotor_particles/flame
execute if score @s terf_data_E matches 300.. run function terf:entity/machines/stfr/visuals/stabilizer/rotor_particles/offline_steam

execute if score @s terf_data_E matches 820 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.overload.plasma',level:3,text:'{"text":"Electromagnetic Systems At Critical Temperature! Unpredictable Plasma Behaviour Expected.","color":"red"}'}
execute if score @s terf_data_E matches 1220 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.overload.field',level:3,text:'{"text":"High Probability Of Plasma Detachment Due To Chamber-Wide Magnetic Field Instability!","color":"red"}'}

#process sounds for this state
function terf:entity/machines/stfr/sound/humming_tick
function terf:entity/machines/stfr/sound/system_noise_tick

execute if score mssr terf_states matches ..0 if predicate datapipes_lib:chances/0.3 run function terf:entity/machines/stfr/states/meltdown/start
particle minecraft:soul_fire_flame ~ ~ ~ 0.4 0.4 0.4 0.06 100 force
particle minecraft:trial_spawner_detection ~ ~ ~ 0.2 0.2 0.2 0.5 50
particle minecraft:explosion ~ ~ ~ 0 0 0 1 1 force
execute if score mssr terf_states matches 0 run particle minecraft:large_smoke ~ ~ ~ 0.4 0.4 0.4 1 100 force
particle minecraft:large_smoke ~ ~ ~ 0.5 0.5 0.5 0.01 10 force
particle flash{color:[1,1,1,1]} ~ ~ ~ 1 1 1 0 3 force
playsound minecraft:entity.zombie_villager.converted master @a[distance=0..] ~ ~ ~ 5 2
scoreboard players add @s terf_data_M 216375
scoreboard players add @s terf_data_P 346743
execute if score mssr terf_states matches 0 as @s[tag=!ou1] run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.overload.int_shield_crit',level:4,text:'{"text":"Primary Internal Shield (Beta) Intensity Compromised! Total Core Containment Failure Imminent.","color":"red"}'}
execute if score mssr terf_states matches 0 run tag @s add ou1
execute if score mssr terf_states matches 5.. run tag @s remove ou1

$execute if score @s[tag=!terf_manual_restabilization_failed] terf_data_E matches 300.. as @e[type=minecraft:text_display,tag=terf_related_$(machine_id),tag=terf_overload_flare,limit=2,sort=random] run function terf:entity/machines/stfr/states/overload/rotate_text_display

$execute if score @s[tag=terf_manual_restabilization_failed] terf_data_E matches 300.. as @e[type=minecraft:text_display,tag=terf_related_$(machine_id),tag=terf_overload_flare,limit=2,sort=random] run function terf:entity/machines/stfr/states/overload/rotate_red_text_display

#plasma being carried out by the cores distorted magnetic field
execute store result score temp terf_states run random value -10..10
scoreboard players operation @s terf_data_Af += temp terf_states

execute store result score temp terf_states run random value -10..10
scoreboard players operation @s terf_data_Ag += temp terf_states

execute store result score temp terf_states run random value -10..10
scoreboard players operation @s terf_data_Ah += temp terf_states

execute if score @s terf_data_Af matches 101.. run scoreboard players set @s terf_data_Af 100
execute if score @s terf_data_Af matches ..-101 run scoreboard players set @s terf_data_Af -100

execute if score @s terf_data_Ag matches 101.. run scoreboard players set @s terf_data_Ag 100
execute if score @s terf_data_Ag matches ..-101 run scoreboard players set @s terf_data_Ag -100

execute if score @s terf_data_Ah matches -99.. run scoreboard players set @s terf_data_Ah -100
execute if score @s terf_data_Ah matches ..-201 run scoreboard players set @s terf_data_Ah -200

execute store result storage terf:temp args.x float 0.002 run scoreboard players get @s terf_data_Af
execute store result storage terf:temp args.y float 0.002 run scoreboard players get @s terf_data_Ag
execute store result storage terf:temp args.z float 0.002 run scoreboard players get @s terf_data_Ah
$execute as @e[type=minecraft:marker,tag=terf_related_$(machine_id),tag=terf_overload_beam] at @s run function terf:entity/machines/stfr/states/overload/plasma_particles/as with storage terf:temp args

$execute if score @s terf_data_E matches 100 as @e[type=minecraft:text_display,tag=terf_related_$(machine_id),tag=terf_overload_flare] run data merge entity @s {text_opacity:200,transformation:{left_rotation:[0.0f,0.0f,0.0f,0.0f]}}

execute if score @s terf_data_E matches 1200 run function terf:entity/machines/stfr/states/overload/plasma_particles/explosion

execute if score @s terf_data_E matches 1200.. run function terf:entity/machines/stfr/states/overload/plasma_particles/summon
execute if score @s terf_data_E matches 1200.. run function terf:entity/machines/stfr/states/overload/plasma_particles/summon
execute if score @s terf_data_E matches 1200.. run function terf:entity/machines/stfr/states/overload/plasma_particles/summon

#manual restabilization
scoreboard players set stab_lenses terf_states 0
execute if block ~5 ~ ~ minecraft:amethyst_block run scoreboard players add stab_lenses terf_states 1
execute if block ~-5 ~ ~ minecraft:amethyst_block run scoreboard players add stab_lenses terf_states 1
execute if block ~ ~5 ~ minecraft:amethyst_block run scoreboard players add stab_lenses terf_states 1
execute if block ~ ~-5 ~ minecraft:amethyst_block run scoreboard players add stab_lenses terf_states 1
execute if block ~ ~ ~5 minecraft:amethyst_block run scoreboard players add stab_lenses terf_states 1
execute if block ~ ~ ~-5 minecraft:amethyst_block run scoreboard players add stab_lenses terf_states 1