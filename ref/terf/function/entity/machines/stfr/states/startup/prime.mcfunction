scoreboard players set @s terf_data_A 1
scoreboard players set @s terf_data_E 0
tag @s add terf_core_starting_alarm
execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep2 ambient @a[distance=0..] ~ ~ ~ 1 1
function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.start.prime',level:0,text:'{"text":"Fusion Reactor Startup Sequence Primed! ","color":"yellow"},{"text":"Awaiting Breaker Activation..."}'}