stopsound @a[distance=..256] * terf:braam

scoreboard players set @a[distance=..80] terf_shake_frequency 30
scoreboard players set @a[distance=..80] terf_shake_magnitude 8
scoreboard players set @s terf_data_A 8
scoreboard players set @s terf_data_E 0
playsound terf:music.hacknet_ost_malware_injection_remix ui @a[tag=!terf_disable_music,distance=0..] ~ ~ ~ 16 1
execute as @a[distance=..256] run function terf:entity/player/title_music {music:"Hacknet OST: Remi Gallego - Malware Injection (remixed)"}
playsound terf:explosion.shieldboom master @a[distance=0..] ~ ~ ~ 20 0
playsound terf:explosion.shieldboom master @a[distance=0..] ~ ~ ~ 20 0
particle minecraft:end_rod ~ ~ ~ 1 1 1 0 1000 force
particle minecraft:end_rod ~ ~ ~ 1 1 1 3 1000 force
particle minecraft:end_rod ~ ~ ~ 1 1 1 1 1000 force
particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0 1 force
particle minecraft:firework ~ ~ ~ 1 1 1 1 1000 force
effect give @a[distance=..35] minecraft:blindness 1 0 true

execute if score @s terf_data_U matches 1.. at @s positioned ~ ~13.5 ~ run function terf:entity/machines/stfr/emergency_controls/power_surge/abort_automatic

scoreboard players add @a[distance=..80] terf_data_P 40

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.reaction_loss.collapse',level:3,text:'{"text":"FUSION REACTOR SHIELD COLLAPSE DETECTED!","color":"aqua"}'}

advancement grant @a[distance=..32] only terf:stfr/reaction_loss

execute positioned ^11 ^ ^ if block ~ ~ ~ glowstone run setblock ~ ~ ~ minecraft:packed_ice
execute positioned ^-11 ^ ^ if block ~ ~ ~ glowstone run setblock ~ ~ ~ minecraft:packed_ice
execute positioned ^ ^11 ^ if block ~ ~ ~ glowstone run setblock ~ ~ ~ minecraft:packed_ice
execute positioned ^ ^-11 ^ if block ~ ~ ~ glowstone run setblock ~ ~ ~ minecraft:packed_ice
execute positioned ^ ^ ^11 if block ~ ~ ~ glowstone run setblock ~ ~ ~ minecraft:packed_ice
execute positioned ^ ^ ^-11 if block ~ ~ ~ glowstone run setblock ~ ~ ~ minecraft:packed_ice
