execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep2 ambient @a[distance=0..] ~ ~ ~ 1 0.6
execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep2 ambient @a[distance=0..] ~ ~ ~ 1 0.64
execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep2 ambient @a[distance=0..] ~ ~ ~ 1 0
function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.econtrols.surge_prime',level:1,text:'{"text":"Fusion Reactor Emergency Power Surge Activation Primed! ","color":"white"},{"text":"Awaiting Control Room Activation Confirmation!","color":"gold"}'}
scoreboard players set @s terf_data_U 1