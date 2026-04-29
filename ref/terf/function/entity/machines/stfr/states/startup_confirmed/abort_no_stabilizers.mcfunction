stopsound @a[distance=..256] * terf:music.alex_giudici_reconstructing_more_science_remix_v2
execute if score @s terf_data_E matches 395.. run playsound terf:explosion.shieldboom ambient @a[distance=0..] ~ ~ ~ 8 1
execute if score @s terf_data_E matches 395.. run particle minecraft:end_rod ~ ~ ~ 0 0 0 2 3000 force
execute if score @s terf_data_E matches 395.. as @a[distance=..20,tag=!terf_wearing_hazmat_suit] run damage @s 5 minecraft:explosion
playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 3 1
playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 3 1
playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 3 1

execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep ambient @a[distance=0..] ~ ~ ~ 8 0
scoreboard players set @s terf_data_A 0
scoreboard players set @s terf_data_E 0
function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:1,text:'{"text":"Cannot Continue Fusion Reactor Startup Sequence: Stabilization Loss Detected!","color":"red"}'}
tag @s remove terf_core_starting_alarm
tag @s remove terf_breakers_activated
stopsound @a[distance=..128] * terf:music.alex_giudici_reconstructing_more_science_remix_v2
function terf:entity/machines/stfr/stabilizers_off
function terf:entity/machines/stfr/visuals/stabilizer/all_stab_rods_off