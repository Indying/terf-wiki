execute if score @s terf_data_E matches ..600 run scoreboard players add @s terf_data_E 1
execute if score @s terf_data_E matches 600.. if score working_stabs terf_states matches 0 run scoreboard players add @s terf_data_E 1

#process reactor logistics
execute if score @s terf_data_E matches ..401 run function terf:entity/machines/stfr/calculations/tick

#event logistics
scoreboard players set auto_reset_cooldown terfmap_states 0

execute if predicate datapipes_lib:chances/3 as @e[type=minecraft:marker,tag=terf_sculk_charge,distance=6..20] if predicate datapipes_lib:chances/3 positioned ~ ~1 ~ if block ~ ~ ~ air run setblock ~ ~ ~ minecraft:cyan_stained_glass_pane

scoreboard players set stabilizer_rotation_duration terf_states 10
execute if score @s terf_data_E matches 400 run function terf:entity/machines/stfr/states/sculk_breakout/shutdown
execute if score @s terf_data_E matches 450 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.sculk.system_damage',level:3,text:'{"text":"Major System Damage! Unable To Retreive Reactor Core Vitals","color":"yellow"}'}

execute if score @s terf_data_E matches 50 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.sculk.viscosity_rising',level:1,text:'{"text":"Fuel Viscosity Rising, Raising Stabilizer Rotor Speed To Compensate","color":"yellow"}'}
execute if score @s terf_data_E matches 60 run scoreboard players set stabilizer_rotation_duration terf_states 7
execute if score @s terf_data_E matches 310 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.sculk.fuel_leak',level:3,text:'{"text":"A Major Fuel Leak Has Been Detected! Please Shut Down The Reactor Immediately!","color":"red"}'}

execute if score @s terf_data_E matches 300 run playsound minecraft:entity.warden.hurt ambient @a[distance=0..] ~ ~ ~ 10 0
execute if score @s terf_data_E matches ..650 run playsound minecraft:entity.warden.heartbeat ambient @a[distance=0..] ~ ~ ~ 10 1.2

execute if score @s terf_data_E matches 500.. if predicate datapipes_lib:chances/10 run function terf:entity/machines/stfr/states/sculk_breakout/case_sculkify

execute if score @s terf_data_E matches 600.. if predicate datapipes_lib:chances/0.3 positioned ~10 ~ ~ if block ~ ~ ~ minecraft:glowstone run setblock ~ ~ ~ sculk
execute if score @s terf_data_E matches 600.. if predicate datapipes_lib:chances/0.3 positioned ~-10 ~ ~ if block ~ ~ ~ minecraft:glowstone run setblock ~ ~ ~ sculk
execute if score @s terf_data_E matches 600.. if predicate datapipes_lib:chances/0.3 positioned ~ ~10 ~ if block ~ ~ ~ minecraft:glowstone run setblock ~ ~ ~ sculk
execute if score @s terf_data_E matches 600.. if predicate datapipes_lib:chances/0.3 positioned ~ ~-10 ~ if block ~ ~ ~ minecraft:glowstone run setblock ~ ~ ~ sculk
execute if score @s terf_data_E matches 600.. if predicate datapipes_lib:chances/0.3 positioned ~ ~ ~10 if block ~ ~ ~ minecraft:glowstone run setblock ~ ~ ~ sculk
execute if score @s terf_data_E matches 600.. if predicate datapipes_lib:chances/0.3 positioned ~ ~ ~-10 if block ~ ~ ~ minecraft:glowstone run setblock ~ ~ ~ sculk

execute if score @s terf_data_E matches 670 run function terf:entity/machines/stfr/states/sculk_breakout/explode
execute if score @s terf_data_E matches 602 run playsound minecraft:entity.warden.sonic_charge ambient @a[distance=0..] ~ ~ ~ 10 0
execute if score @s terf_data_E matches 602 run playsound minecraft:entity.warden.sonic_charge ambient @a[distance=0..] ~ ~ ~ 10 0
execute if score @s terf_data_E matches 602 run playsound minecraft:entity.warden.sonic_charge ambient @a[distance=0..] ~ ~ ~ 10 0
execute if score @s terf_data_E matches 602 run playsound minecraft:entity.warden.sonic_charge ambient @a[distance=0..] ~ ~ ~ 10 0
execute if score @s terf_data_E matches 602 run playsound minecraft:entity.warden.sonic_charge ambient @a[distance=0..] ~ ~ ~ 10 0
execute if score @s terf_data_E matches 602 run playsound minecraft:entity.warden.sonic_charge ambient @a[distance=0..] ~ ~ ~ 10 0
execute if score @s terf_data_E matches 602 run playsound minecraft:entity.warden.sonic_charge ambient @a[distance=0..] ~ ~ ~ 10 0
execute if score @s terf_data_E matches 602 run playsound minecraft:entity.warden.sonic_charge ambient @a[distance=0..] ~ ~ ~ 10 0
execute if score @s terf_data_E matches 670.. run particle minecraft:sculk_soul ~ ~ ~ 0 0 0 1 10 force
execute if score @s terf_data_E matches 670.. run playsound minecraft:entity.warden.ambient ambient @a[distance=0..] ~ ~ ~ 3 1.7
execute if score @s terf_data_E matches 690.. positioned ~ ~-3 ~ run function terf:entity/sculk_charge/summon

scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players operation temp terf_states %= 80 terf_states
execute if score temp terf_states matches 0 run playsound terf:alarms.alarm ambient @a[distance=0..] ~ ~ ~ 8 0

data modify storage terf:temp args set value {arg1:'function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:"none",level:5,text:\'{"text":"Monitoring Error! CODE: x',arg3:'","color":"yellow"}\'}'}
execute store result storage terf:temp args.arg2 int 1 run random value 1000000..9999999
execute if score @s terf_data_E matches 401..450 run function datapipes_lib:require/with_args/3 with storage terf:temp args

#process visuals for this state
scoreboard players set core_scale terf_states 100
data modify storage terf:temp displays.group_main[1].messages[1] set value {"text":"⚠DEGRADING⚠","color":"red"}
execute if score @s terf_data_E matches 400.. run data modify storage terf:temp displays.group_main[1].messages[1] set value {"text":"⚠OUTR FAIL⚠","color":"dark_red"}
execute if score @s terf_data_E matches 400.. run data modify storage terf:temp displays.group_core[0].messages[0] set value {"text":"?  ?  ?",screen_color:"gray"}
execute if score @s terf_data_E matches 400..650 run function terf:entity/machines/stfr/sound/alarm_measurement_error

execute if score @s terf_data_E matches ..100 run function terf:entity/machines/stfr/visuals/core/tick
execute if score @s terf_data_E matches 101.. run particle minecraft:sculk_soul ~ ~ ~ 0.5 0.5 0.5 0 100 force

execute if score @s terf_data_E matches ..401 run function terf:entity/machines/stfr/visuals/shield/tick
execute if score @s terf_data_E matches ..401 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_E matches ..401 run function terf:entity/machines/stfr/visuals/stabilizer/stabilizer_shield_beam_tick
execute if score @s terf_data_E matches ..401 run function terf:entity/machines/stfr/visuals/stabilizer/rotation/rotate_stabilizers with entity @s data.terf

execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab6] run particle minecraft:sculk_charge{roll:0} ~ ~-10.5 ~ 0.7 0 0.7 0 30 force
execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab6] run particle minecraft:sculk_charge{roll:0} ~ ~-10.5 ~ 0.7 0 0.7 0 30 force

execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab5] run particle minecraft:sculk_charge{roll:0} ~-9.5 ~ ~ 0 0.7 0.7 0 30 force
execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab5] run particle minecraft:sculk_charge{roll:0} ~-8.5 ~ ~ 0 0.7 0.7 0 30 force

execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab4] run particle minecraft:sculk_charge{roll:0} ~ ~ ~-9.5 0.7 0.7 0 0 30 force
execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab4] run particle minecraft:sculk_charge{roll:0} ~ ~ ~-7.5 0.7 0.7 0 0 30 force

execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab3] run particle minecraft:sculk_charge{roll:0} ~9.5 ~ ~ 0 0.7 0.7 0 30 force
execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab3] run particle minecraft:sculk_charge{roll:0} ~7.5 ~ ~ 0 0.7 0.7 0 30 force

execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab2] run particle minecraft:sculk_charge{roll:0} ~ ~ ~9.5 0.7 0.7 0 0 30 force
execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab2] run particle minecraft:sculk_charge{roll:0} ~ ~ ~7.5 0.7 0.7 0 0 30 force

execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab1] run particle minecraft:sculk_charge{roll:0} ~ ~10.5 ~ 0.7 0 0.7 0 30 force
execute if score @s terf_data_E matches 300.. as @s[tag=terf_stab1] run particle minecraft:sculk_charge{roll:0} ~ ~8.5 ~ 0.7 0 0.7 0 30 force

#process sounds for this state
execute if score @s terf_data_E matches ..401 run function terf:entity/machines/stfr/sound/humming_tick
execute if score @s terf_data_E matches ..401 run function terf:entity/machines/stfr/sound/system_noise_tick