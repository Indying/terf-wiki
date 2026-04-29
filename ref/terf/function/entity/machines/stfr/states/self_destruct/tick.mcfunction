#2096 = cant be aborted anymore | 2405 = start self destruct | 2910 = start stabilizer overload | 3320 = core destroying case with flying blocks | 3690 = kaboom
function terf:autokick

scoreboard players add @s terf_data_E 1

#process visuals for this state
scoreboard players set core_scale terf_states 100
scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players remove temp terf_states 2516
scoreboard players operation temp terf_states /= 4 terf_states
execute if score @s terf_data_E matches 2910.. run scoreboard players operation core_scale terf_states = temp terf_states 

scoreboard players add @s terf_data_V 100
execute if score @s terf_data_E matches 2405.. run scoreboard players add @s terf_data_V 100
execute if score @s terf_data_E matches 2850.. run scoreboard players add @s terf_data_V 100
execute if score @s terf_data_E matches 2870.. run scoreboard players add @s terf_data_V 100
execute if score @s terf_data_E matches 2890.. run scoreboard players add @s terf_data_V 100
execute if score @s terf_data_E matches 2910.. run scoreboard players add @s terf_data_V 100

execute if score @s terf_data_E matches 2980.. run function terf:entity/machines/stfr/states/self_destruct/stabilizer_fire
execute if score @s terf_data_E matches 3124.. run function terf:entity/machines/stfr/states/self_destruct/stabilizer_lava

execute if score @s terf_data_E matches 2910.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_E matches 2920.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_E matches 2930.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_E matches 2940.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_E matches 2950.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_E matches 2960.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_E matches 2970.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_E matches 2980.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_E matches 2990.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_E matches 3000.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_E matches 3010.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_E matches 3020.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_E matches 3030.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step

execute if score @s terf_data_E matches 3320.. run function terf:entity/machines/stfr/visuals/core/tick
execute if score @s terf_data_E matches 3320.. run function terf:entity/machines/stfr/visuals/core/tick
execute unless entity @s[tag=terf_stfr_offline] run function terf:entity/machines/stfr/visuals/core/tick

execute unless entity @s[tag=terf_stfr_offline] if score @s terf_data_E matches ..3620 run function terf:entity/machines/stfr/visuals/shield/tick
execute unless entity @s[tag=terf_stfr_offline] run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute unless score @s terf_data_E matches 2435.. unless entity @s[tag=terf_stfr_offline] run function terf:entity/machines/stfr/visuals/stabilizer/stabilizer_shield_beam_tick
execute if score @s terf_data_E matches 2435.. run function terf:entity/machines/stfr/visuals/stabilizer/stabilizer_shield_beam_tick
execute if score @s terf_data_E matches 2455.. run function terf:entity/machines/stfr/visuals/stabilizer/stabilizer_power_beam_tick
execute unless entity @s[tag=terf_stfr_offline] run function terf:entity/machines/stfr/visuals/stabilizer/rotation/rotate_stabilizers with entity @s data.terf

function terf:entity/machines/stfr/calculations/extra

#event logic
execute if score @s terf_data_E matches 100 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:2,text:'{"text":"Self-Destruct Protocol Has Been Initialized...","color":"red"}'}

execute if score @s terf_data_E matches 2405 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:3,text:'{"text":"Self-Destruct Protocol Is Now In Effect.","color":"red"}'}
execute if score @s terf_data_E matches 2405 run function terf:entity/machines/stfr/stabilizers_on

execute if score @s terf_data_E matches 2455..2485 if entity @s[tag=terf_stfr_offline] run playsound minecraft:block.note_block.snare ambient @a[distance=0..] ~ ~ ~ 4 2
execute if score @s terf_data_E matches 2455..2485 if entity @s[tag=terf_stfr_offline] run particle minecraft:explosion ~ ~ ~ 0 0 0 0.3 10 force
execute if score @s terf_data_E matches 2485 if entity @s[tag=terf_stfr_offline] run function terf:entity/machines/stfr/states/startup_confirmed/activate
execute if score @s terf_data_E matches 2485 if entity @s[tag=terf_stfr_offline] run tag @s remove terf_stfr_offline

execute if score @s terf_data_E matches 2405 positioned ~9 ~ ~ if block ~ ~ ~ minecraft:red_concrete run setblock ~ ~ ~ minecraft:redstone_block
execute if score @s terf_data_E matches 2405 positioned ~-9 ~ ~ if block ~ ~ ~ minecraft:red_concrete run setblock ~ ~ ~ minecraft:redstone_block
execute if score @s terf_data_E matches 2405 positioned ~ ~9 ~ if block ~ ~ ~ minecraft:red_concrete run setblock ~ ~ ~ minecraft:redstone_block
execute if score @s terf_data_E matches 2405 positioned ~ ~-9 ~ if block ~ ~ ~ minecraft:red_concrete run setblock ~ ~ ~ minecraft:redstone_block
execute if score @s terf_data_E matches 2405 positioned ~ ~ ~9 if block ~ ~ ~ minecraft:red_concrete run setblock ~ ~ ~ minecraft:redstone_block
execute if score @s terf_data_E matches 2405 positioned ~ ~ ~-9 if block ~ ~ ~ minecraft:red_concrete run setblock ~ ~ ~ minecraft:redstone_block
execute if score @s terf_data_E matches 2410 run tag @s remove terf_broadcaston
execute if score @s terf_data_E matches 2410 run function terf:entity/machines/stfr/structure_checks with entity @s data.terf
execute if score @s terf_data_E matches 2410 run function terf:entity/machines/stfr/broadcast_tell

execute if score @s terf_data_E matches 2800 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:3,text:'{"text":"Removing Limits From Stabilizer Power Settings... Stabilizer Boost Level Is Now: 2,147,483,647","color":"red"}'}

execute if score @s terf_data_E matches 2910 run function terf:require/run_n_times {command:'playsound terf:charge_up.motor_rampup ambient @a[distance=0..] ~ ~ ~ 8 0.8',n:2}
execute if score @s terf_data_E matches 2910 run tag @s add terf_stfr_opshield
execute if score @s terf_data_E matches 2910.. run scoreboard players add @s terf_data_M 332634
execute if score @s terf_data_E matches 2910.. run scoreboard players add @s terf_data_P 1032634
execute if score @s terf_data_E matches 2940 run function terf:require/run_n_times {command:'playsound terf:powerpurge ambient @a[distance=0..] ~ ~ ~ 10 0',n:4}

execute if score @s terf_data_E matches 2910..2915 run scoreboard players add @a[distance=..80] terf_shake_magnitude 1
execute if score @s terf_data_E matches 2910..3010 run scoreboard players add @a[distance=..80] terf_shake_frequency 3

execute if score @s terf_data_E matches 2910.. run function terf:entity/machines/stfr/case_fire

execute if score @s terf_data_E matches 3360 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:4,text:'{"text":"Extreme Stabilizer Overload! Total System Disassembly Imminent. Brace For Impact!","color":"red"}'}
execute if score @s terf_data_E matches 3320 run playsound terf:powerpurge ambient @a[distance=0..] ~ ~ ~ 10 2

execute if score @s terf_data_E matches 3700 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:5,text:'{"text":"Monitoring Error! CODE: POINTOFNORETURNSETPOINT_REACHED","color":"yellow"}'}
data modify storage terf:temp args set value {arg1:'function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:"none",level:5,text:\'{"text":"Monitoring Error! CODE: x',arg3:'","color":"yellow"}\'}'}
execute store result storage terf:temp args.arg2 int 1 run random value 1000000..9999999
execute if score @s terf_data_E matches 3700.. run function datapipes_lib:require/with_args/3 with storage terf:temp args

execute if score @s terf_data_E matches 3320 run scoreboard players set @a[distance=..80] terf_shake_magnitude 50
execute if score @s terf_data_E matches 3320 run function terf:entity/machines/stfr/case_explosion
execute if score @s terf_data_E matches 3320.. run function terf:require/run_n_times {command:'function terf:entity/machines/stfr/states/self_destruct/beam_random',n:4}
execute if score @s terf_data_E matches 3320.. run scoreboard players add @s terf_data_M 1032634
execute if score @s terf_data_E matches 3320.. run particle minecraft:explosion ~ ~ ~ 0.01 0.01 0.01 3 10 force

execute if score @s terf_data_E matches 3740.. run function terf:entity/machines/stfr/states/detonation/detonate_reactor
execute if score @s terf_data_E matches 3525 run function terf:require/run_n_times {command:'playsound terf:charge_up.heavy_startup ambient @a[distance=0..] ~ ~ ~ 10 2',n:20}
execute if score @s terf_data_E matches 3730 run function terf:require/run_n_times {command:'playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 0',n:10}

scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players operation temp terf_states %= 30 terf_states

execute if score @s terf_data_E matches 2405..2910 if score temp terf_states matches ..15 run function terf:entity/machines/stfr/visuals/stabilizer/all_stab_rods_on
execute if score @s terf_data_E matches 2405..2910 unless score temp terf_states matches ..15 run function terf:entity/machines/stfr/visuals/stabilizer/all_stab_rods_off

execute if score @s terf_data_E matches 3320.. if score temp terf_states matches 15 run summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_small_flash"],billboard:"center",text:{"text":"\ueef2"},background:0,view_range:32,brightness:{sky:15,block:15},alignment:center}

scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players remove temp terf_states 2800
execute if score temp terf_states matches 101.. run scoreboard players set temp terf_states 100

data modify storage terf:temp args3 set value {x:0,y:0,command:"execute positioned ^ ^ ^-15 run function terf:entity/machines/stfr/states/self_destruct/axis_y"}
execute store result storage terf:temp args3.z double 0.1 run scoreboard players get temp terf_states
execute if score temp terf_states matches 0.. rotated 0 -90 run function datapipes_lib:require/run_relative_rotated with storage terf:temp args3
execute if score temp terf_states matches 0.. rotated 0 90 run function datapipes_lib:require/run_relative_rotated with storage terf:temp args3
data modify storage terf:temp args3.command set value "execute positioned ^ ^ ^-15 run function terf:entity/machines/stfr/states/self_destruct/axis_z"
execute if score temp terf_states matches 0.. rotated 0 0 run function datapipes_lib:require/run_relative_rotated with storage terf:temp args3
execute if score temp terf_states matches 0.. rotated 180 0 run function datapipes_lib:require/run_relative_rotated with storage terf:temp args3
data modify storage terf:temp args3.command set value "execute positioned ^ ^ ^-15 run function terf:entity/machines/stfr/states/self_destruct/axis_x"
execute if score temp terf_states matches 0.. rotated -90 0 run function datapipes_lib:require/run_relative_rotated with storage terf:temp args3
execute if score temp terf_states matches 0.. rotated 90 0 run function datapipes_lib:require/run_relative_rotated with storage terf:temp args3

execute if score @s terf_data_E matches 3542 positioned ~10 ~ ~ run function terf:entity/machines/stfr/explode_stabilizer
execute if score @s terf_data_E matches 3566 positioned ~-10 ~ ~ run function terf:entity/machines/stfr/explode_stabilizer
execute if score @s terf_data_E matches 3618 positioned ~ ~10 ~ run function terf:entity/machines/stfr/explode_stabilizer
execute if score @s terf_data_E matches 3570 positioned ~ ~-10 ~ run function terf:entity/machines/stfr/explode_stabilizer
execute if score @s terf_data_E matches 3515 positioned ~ ~ ~10 run function terf:entity/machines/stfr/explode_stabilizer
execute if score @s terf_data_E matches 3689 positioned ~ ~ ~-10 run function terf:entity/machines/stfr/explode_stabilizer

execute if score @s terf_data_E matches 3320 run title @a[distance=..256,tag=!terf_epilepsy_mode] times 0t 50s 10s
execute if score @s terf_data_E matches 3320 run title @a[distance=..256,tag=!terf_epilepsy_mode] title {"text":"\uEff3"}
execute if score @s terf_data_E matches 3320 run effect give @a[distance=..256,tag=!terf_epilepsy_mode] minecraft:blindness 1 255 true