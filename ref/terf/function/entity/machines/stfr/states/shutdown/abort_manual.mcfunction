scoreboard players set @s terf_data_A 3
tag @s remove terf_core_starting_alarm
function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.shutdown.abort_manual',level:1,text:'{"text":"The Fusion Reactor Shutdown Sequence Has Been Manually Aborted."}'}
execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep record @a[distance=0..] ^ ^ ^1 8 0
tag @s remove terf_stfr_opshield