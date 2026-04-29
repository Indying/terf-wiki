scoreboard players set @s terf_data_A 9
scoreboard players set @s terf_data_E 0
tag @s add terf_core_starting_alarm
execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep2 master @a[distance=0..] ~ ~ ~ 1 1
function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.reaction_loss.restab_start',level:1,text:'{"text":"Fusion Reactor Re-Ignition Protocol Initiated!","color":"aqua"}'}

stopsound @a[distance=..256] * terf:music.hacknet_ost_malware_injection_remix
playsound terf:music.hacknet_music_end ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1

execute positioned ^10 ^ ^ if block ~ ~ ~ packed_ice run setblock ~ ~ ~ minecraft:glowstone
execute positioned ^-10 ^ ^ if block ~ ~ ~ packed_ice run setblock ~ ~ ~ minecraft:glowstone
execute positioned ^ ^10 ^ if block ~ ~ ~ packed_ice run setblock ~ ~ ~ minecraft:glowstone
execute positioned ^ ^-10 ^ if block ~ ~ ~ packed_ice run setblock ~ ~ ~ minecraft:glowstone
execute positioned ^ ^ ^10 if block ~ ~ ~ packed_ice run setblock ~ ~ ~ minecraft:glowstone
execute positioned ^ ^ ^-10 if block ~ ~ ~ packed_ice run setblock ~ ~ ~ minecraft:glowstone
