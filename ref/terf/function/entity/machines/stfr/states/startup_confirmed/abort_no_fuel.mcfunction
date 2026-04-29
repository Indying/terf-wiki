stopsound @a[distance=..256] * terf:music.alex_giudici_reconstructing_more_science_remix_v2
execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep master @a[distance=0..] ~ ~ ~ 8 0
scoreboard players set @s terf_data_A 0
function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:1,text:'{"text":"Cannot Continue Fusion Reactor Startup Sequence: Not Enough Fuel For Safe Startup","color":"red"}'}
tag @s remove terf_core_starting_alarm
tag @s remove terf_breakers_activated
stopsound @a[distance=..128] * terf:music.alex_giudici_reconstructing_more_science_remix_v2
function terf:entity/machines/stfr/stabilizers_off
function terf:entity/machines/stfr/visuals/stabilizer/all_stab_rods_off