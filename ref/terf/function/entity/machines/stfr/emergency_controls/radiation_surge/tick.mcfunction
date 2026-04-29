particle minecraft:electric_spark ~ ~-13 ~ 0.4 0 0.4 1 10 force
execute if score @s terf_data_Ac matches 10.. run particle minecraft:electric_spark ~ ~-12 ~ 0.4 0 0.4 0.6 20 force
execute if score @s terf_data_Ac matches 20.. run particle minecraft:electric_spark ~ ~-11 ~ 0.4 0 0.4 0 20 force
execute if score @s terf_data_Ac matches 30.. run particle minecraft:electric_spark ~ ~-10 ~ 0.4 0 0.4 0 20 force
execute if score @s terf_data_Ac matches 40.. run particle minecraft:electric_spark ~ ~-9 ~ 0.8 0 0.8 0 20 force
execute if score @s terf_data_Ac matches 50.. run particle minecraft:electric_spark ~ ~-8 ~ 1 0 1 0 20 force
execute if score @s terf_data_Ac matches 60.. run particle minecraft:electric_spark ~ ~-7 ~ 1 0 1 0 20 force
execute if score @s terf_data_Ac matches 70.. run particle minecraft:electric_spark ~ ~-6 ~ 1 0 1 0 20 force
execute if score @s terf_data_Ac matches 80.. run particle minecraft:electric_spark ~ ~-5 ~ 1 0 1 0 20 force
execute if score @s terf_data_Ac matches 90.. run particle minecraft:electric_spark ~ ~-4 ~ 1 0 1 0 20 force

execute if predicate datapipes_lib:chances/10 positioned ~ ~-9 ~ run function terf:entity/machines/stfr/emergency_controls/radiation_surge/break_stab_6_rotation

execute if score @s terf_data_Ac matches 7 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.econtrols.radsurge_detected',level:2,text:'{"text":"Stabilizer D Power Cycle Overload Detected!","color":"yellow"}'}

execute if score @s terf_data_Ac matches 1 run playsound terf:charge_up.mega_chargeup2 ambient @a[distance=0..] ~ ~ ~ 4 1
execute if score @s terf_data_Ac matches 45 run playsound terf:spotlight ambient @a[distance=0..] ~ ~ ~ 6 1
execute if score @s terf_data_Ac matches 45..47 run particle flash{color:[1,1,1,1]} ~ ~ ~ 0 0 0 1 2 force
execute if score @s terf_data_Ac matches 56..60 run particle flash{color:[1,1,1,1]} ~ ~ ~ 0 0 0 1 2 force
execute if score @s terf_data_Ac matches 70 run particle electric_spark ~ ~ ~ 0 0 0 3 1000 force
execute if score @s terf_data_Ac matches 70 run playsound terf:spotlight ambient @a[distance=0..] ~ ~ ~ 6 0
execute if score @s terf_data_Ac matches 80.. run particle flash{color:[1,1,1,1]} ~ ~ ~ 0 0 0 1 2 force

data modify storage terf:temp args set value {x:0,y:0,command:"function terf:entity/machines/stfr/emergency_controls/radiation_surge/particle"}

execute store result storage terf:temp args.z double 0.3 run scoreboard players get @s terf_data_Ac

execute positioned ~ ~-13 ~ if score @s terf_data_Ac matches 0..45 rotated 0 -90 run function datapipes_lib:require/run_relative_rotated with storage terf:temp args

scoreboard players add @s terf_data_Ad 420

scoreboard players add @s terf_data_Ac 1
execute if score @s terf_data_Ac matches 170.. run function terf:entity/machines/stfr/emergency_controls/radiation_surge/end