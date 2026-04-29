scoreboard players add @s terf_data_U 1
execute if score @s terf_data_U matches 300 run playsound terf:charge_up.purgechargeup ambient @a[distance=0..] ~ ~ ~ 5
execute if score @s terf_data_U matches 300 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.econtrols.surge_15s',level:1,text:'{"text":"Fusion Reactor Emergency Power Surge Activation Will Commince In 15 seconds!","color":"white"},{"text":" Evacuate The Core Chamber Immediately!","color":"red"}'}
execute if score @s terf_data_U matches 350 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.econtrols.surge_charging',level:1,text:'{"text":"Charging Stabilizer Internal Capacitors For Power Surge... Power Output May Fluctuate!","color":"white"}'}
execute if score @s terf_data_U matches 350.. if score @s terf_data_Ad matches 100.. run scoreboard players remove @s terf_data_Ad 100
execute if score @s terf_data_U matches 350.. if score @s terf_data_Ad matches 1000.. run scoreboard players remove @s terf_data_Ad 1000
execute if score @s terf_data_U matches 350.. if score @s terf_data_Ad matches 10000.. run scoreboard players remove @s terf_data_Ad 10000
execute if score @s terf_data_U matches 350.. if score @s terf_data_Ad matches 90000.. run scoreboard players remove @s terf_data_Ad 90000
execute if score @s terf_data_U matches 300..900 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 310..890 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 320..880 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 330..870 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 340..860 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 350..850 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 360..840 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 370..830 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 380..820 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 390..810 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 400..800 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 410..790 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 420..780 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 430..770 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 440..760 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 450..750 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 460..740 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 470..730 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 480..720 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 490..710 run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick
execute if score @s terf_data_U matches 500..700 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_U matches 510..690 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_U matches 520..680 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_U matches 530..670 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_U matches 540..660 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_U matches 550..650 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_U matches 560..640 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_U matches 570..630 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_U matches 580..620 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_U matches 590..610 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
execute if score @s terf_data_U matches 600.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step

execute if score @s terf_data_U matches 600 run playsound terf:powerpurge master @a[distance=0..] ~ ~ ~ 5
execute if score @s terf_data_U matches 600 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.econtrols.surge_activated',level:1,text:'{"text":"Fusion Reactor Emergency Power Surge Activated! ","color":"white"},{"text":"Extreme Core Chamber Radiation Hazard!","color":"red"}'}
execute if score @s terf_data_U matches 600.. positioned ~-14 ~-14 ~-14 as @a[dx=28,dy=28,dz=28] run scoreboard players add @s terf_data_A 4215
execute if score @s terf_data_U matches 1200.. run tag @s remove terf_stfr_surge_unabortable
execute if score @s terf_data_U matches 1200.. run tag @s remove terf_stfr_opshield
execute if score @s terf_data_U matches 1200.. run scoreboard players set @s terf_data_U 0
execute if score @s terf_data_U matches 600.. run tag @s add terf_stfr_opshield
execute if score @s terf_data_U matches 600..700 run particle minecraft:electric_spark ~ ~ ~ 5 5 5 0.1 10 force
execute if score @s terf_data_U matches 600..800 run particle minecraft:electric_spark ~ ~ ~ 5 5 5 0.1 10 force
execute if score @s terf_data_U matches 600..900 run particle minecraft:electric_spark ~ ~ ~ 5 5 5 0.1 10 force
execute if score @s terf_data_U matches 600..1000 run particle minecraft:electric_spark ~ ~ ~ 5 5 5 0.1 10 force
execute if score @s terf_data_U matches 600..1100 run particle minecraft:electric_spark ~ ~ ~ 5 5 5 0.1 10 force
execute if score @s terf_data_U matches 600..1200 run particle minecraft:electric_spark ~ ~ ~ 5 5 5 0.1 10 force

execute if score @s terf_data_U matches 600.. as @s[tag=terf_stab2] run particle minecraft:electric_spark ~ ~ ~3 0 0 2 2 100 force
execute if score @s terf_data_U matches 600.. as @s[tag=terf_stab4] run particle minecraft:electric_spark ~ ~ ~-3 0 0 2 2 100 force
execute if score @s terf_data_U matches 600.. as @s[tag=terf_stab5] run particle minecraft:electric_spark ~-3 ~ ~ 2 0 0 2 100 force
execute if score @s terf_data_U matches 600.. as @s[tag=terf_stab3] run particle minecraft:electric_spark ~3 ~ ~ 2 0 0 2 100 force
execute if score @s terf_data_U matches 600.. as @s[tag=terf_stab1] run particle minecraft:electric_spark ~ ~2 ~ 0 2 0 2 100 force
execute if score @s terf_data_U matches 600.. as @s[tag=terf_stab6] run particle minecraft:electric_spark ~ ~-2 ~ 0 2 0 2 100 force
execute if score @s terf_data_U matches 600.. if score @s terf_data_A matches 3 if score @s terf_data_B matches ..9900 run scoreboard players add @s terf_data_B 25

data modify storage terf:temp args set value {x:0,y:0,command:"function terf:entity/machines/stfr/emergency_controls/power_surge/axis_y"}

scoreboard players operation temp terf_states = @s terf_data_U
scoreboard players remove temp terf_states 600

execute store result storage terf:temp args.z double 0.1 run scoreboard players get temp terf_states

execute as @s[tag=terf_stab1] if score temp terf_states matches 0..140 rotated 0 -90 run function datapipes_lib:require/run_relative_rotated with storage terf:temp args
execute as @s[tag=terf_stab6] if score temp terf_states matches 0..140 rotated 0 90 run function datapipes_lib:require/run_relative_rotated with storage terf:temp args

data modify storage terf:temp args.command set value "function terf:entity/machines/stfr/emergency_controls/power_surge/axis_z"
execute as @s[tag=terf_stab2] if score temp terf_states matches 0..140 rotated 0 0 run function datapipes_lib:require/run_relative_rotated with storage terf:temp args
execute as @s[tag=terf_stab4] if score temp terf_states matches 0..140 rotated 180 0 run function datapipes_lib:require/run_relative_rotated with storage terf:temp args

data modify storage terf:temp args.command set value "function terf:entity/machines/stfr/emergency_controls/power_surge/axis_x"
execute as @s[tag=terf_stab3] if score temp terf_states matches 0..140 rotated -90 0 run function datapipes_lib:require/run_relative_rotated with storage terf:temp args
execute as @s[tag=terf_stab5] if score temp terf_states matches 0..140 rotated 90 0 run function datapipes_lib:require/run_relative_rotated with storage terf:temp args
