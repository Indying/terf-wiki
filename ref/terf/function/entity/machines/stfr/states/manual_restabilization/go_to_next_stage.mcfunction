scoreboard players add @s terf_data_Ab 1
playsound terf:alarms.amogus ambient @a[distance=0..] ~ ~ ~ 8 0
playsound terf:alarms.amogus ambient @a[distance=0..] ~ ~ ~ 8 0
playsound terf:alarms.amogus ambient @a[distance=0..] ~ ~ ~ 8 0
playsound terf:alarms.amogus ambient @a[distance=0..] ~ ~ ~ 8 0

execute if score @s terf_data_Ab matches 1 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.manual_restab.breakers',level:1,text:'{"text":"Current Objective: ","color":"dark_aqua"},"Engage Reactor Breakers"'}
execute if score @s terf_data_Ab matches 2 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.manual_restab.reconnect_panel',level:1,text:'{"text":"Current Objective: ","color":"dark_aqua"},"Reconnect Reactor Control Panel Via. Mainframe"'}
execute if score @s terf_data_Ab matches 3 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.manual_restab.replace_lenses',level:1,text:'{"text":"Current Objective: ","color":"dark_aqua"},"Replace Amethyst Lenses In Reactor Stabilizers Back To Redstone Lamps"'}
execute if score @s terf_data_Ab matches 4 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.manual_restab.sstb',level:1,text:'{"text":"Current Objective: ","color":"dark_aqua"},"Have At Least 2 Stabilizers Functional, Then Confirm Reactor Restabilization By Pressing SSTB"'}
