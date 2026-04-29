#visuals
scoreboard players set terminated terf_states 2000
data modify storage terf:temp args set from entity @s data.terf
data modify storage terf:temp args.max_duration set value 20
function terf:entity/machines/stfr/states/overload/shield_explosion_beams/iterate

particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0 20 force
particle minecraft:firework ~ ~ ~ 1 1 1 1 1000 force
particle minecraft:explosion ~ ~ ~ 0 0 0 10 6 force
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_large_flash"],billboard:"center",text:{"text":"\ueef2"},background:0,view_range:16,brightness:{sky:15,block:15},alignment:center}

title @a[distance=..40] times 0 1 3
title @a[distance=..40] title "\ueff4"

effect give @a[distance=..35] minecraft:blindness 1 0 true

scoreboard players set @a[distance=..80] terf_shake_magnitude 5
scoreboard players set @a[distance=..80] terf_shake_frequency 300
scoreboard players add @a[distance=..80] terf_data_P 60

#sounds
stopsound @a[distance=..256] * terf:braam
stopsound @a[distance=..256] * terf:music.bgmusic2
stopsound @a[distance=..256] * terf:music.alex_giudici_reconstructing_more_science_remix_v2
playsound terf:explosion.shieldboom master @a[distance=0..] ~ ~ ~ 24 1
playsound terf:explosion.shieldboom master @a[distance=0..] ~ ~ ~ 24 1
playsound terf:explosion.shieldboom master @a[distance=0..] ~ ~ ~ 24 1
function terf:require/run_n_times {n:10,command:'playsound terf:charge_up.heavy_startup master @a[distance=0..] ~ ~ ~ 5 1.5'}

#logic
execute as @a[distance=..20,tag=!terf_wearing_hazmat_suit] run damage @s 5 minecraft:explosion
advancement grant @a[distance=..128] only terf:stfr/stfr_meltdown

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.overload.start',level:3,text:'{"text":"Failure Of Primary Outer Core Shield Detected! REACTOR CORE IS NOW IN AN OVERLOAD STATE!","color":"yellow"}'}

execute if score @s terf_data_U matches 1.. at @s positioned ~ ~13.5 ~ run function terf:entity/machines/stfr/emergency_controls/power_surge/abort_automatic


scoreboard players set @s terf_data_Af 0
scoreboard players set @s terf_data_Ag 0
scoreboard players set @s terf_data_Ah -100

scoreboard players set @s terf_data_A 5
scoreboard players set @s terf_data_E 0
scoreboard players set @s terf_data_B 0
execute if score @s terf_data_L matches 1.. run scoreboard players add @s terf_data_L 151756756
execute if score @s terf_data_L matches ..-1 run scoreboard players remove @s terf_data_L 151756756

function terf:entity/machines/stfr/states/overload/summon_text_displays

#music
execute as @a[distance=..256,tag=terf_music_crediting] run function terf:entity/player/title_music {music:"Hacknet OST: Remi Gallego - Panic Track"}
execute if predicate datapipes_lib:chances/1 run scoreboard players set secret_overload_music terf_states 1
execute unless score secret_overload_music terf_states matches 1.. run return run playsound terf:music.hacknet_ost_panic_track master @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 16

playsound terf:music.hacknet_ost_paki_trak master @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 16
scoreboard players set secret_overload_music terf_states 0
