function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.econtrols.surge_abort_auto',level:1,text:'{"text":"The Fusion Reactor Power Surge Activation Has Been Automatically Aborted! ","color":"white"}'}
playsound terf:alarms.beep ambient @a[distance=0..] ~ ~ ~ 8 0
stopsound @a[distance=..128] * terf:charge_up.purgechargeup
stopsound @a[distance=..128] * terf:powerpurge
execute if score @s terf_data_U matches 320.. at @s run playsound terf:charge_up.mega_chargedown ambient @a[distance=0..] ~ ~ ~ 8 2
execute if score @s terf_data_U matches 600.. run playsound terf:spotlight ambient @a[distance=0..] ~ ~ ~ 8 1
execute if score @s terf_data_U matches 600.. run playsound terf:spotlight ambient @a[distance=0..] ~ ~ ~ 8 1
execute if score @s terf_data_U matches 600.. run playsound terf:spotlight ambient @a[distance=0..] ~ ~ ~ 8 1
execute if score @s terf_data_U matches 600.. run playsound terf:spotlight ambient @a[distance=0..] ~ ~ ~ 8 1
execute if score @s terf_data_U matches 600.. run particle minecraft:end_rod ~ ~ ~ 0 0 0 1 10000 force
scoreboard players set @s terf_data_U 0