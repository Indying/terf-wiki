scoreboard players set @s terf_data_A 3
tag @s remove terf_core_starting_alarm
function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.shutdown.abort_auto',level:1,text:'{"text":"Cannot Continue Fusion Reactor Shutdown Sequence: Shield Stress Too High!","color":"red"}'}
execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep record @a[distance=0..] ^ ^ ^1 8 0
tag @s remove terf_stfr_opshield