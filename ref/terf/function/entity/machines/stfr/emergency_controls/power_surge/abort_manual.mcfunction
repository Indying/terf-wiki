function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.econtrols.surge_abort_manual',level:1,text:'{"text":"The Fusion Reactor Power Surge Activation Has Been Manually Aborted! ","color":"white"}'}
playsound terf:alarms.beep master @a[distance=0..] ~ ~ ~ 8 0
stopsound @a[distance=..128] * terf:charge_up.purgechargeup
execute if score @s terf_data_U matches 320.. at @s run playsound terf:charge_up.mega_chargedown master @a[distance=0..] ~ ~ ~ 8 2
scoreboard players set @s terf_data_U 0