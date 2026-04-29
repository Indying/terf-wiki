execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep record @a[distance=0..] ^ ^ ^1 8 0
scoreboard players set @s terf_data_A 0
function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.start.abort_manual',level:0,text:'{"text":"The Fusion Reactor Startup Sequence Has Been Manually Aborted"}'}

tag @s remove terf_core_starting_alarm
tag @s remove terf_breakers_activated
tag @s remove terf_bcd_breakers
tag @s remove terf_breaker_interested
function terf:entity/machines/stfr/stabilizers_off
function terf:entity/machines/stfr/visuals/stabilizer/all_stab_rods_off