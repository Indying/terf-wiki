data modify storage terf:temp args set from entity @s data.terf
$data modify storage terf:temp args.Pos set from entity @n[type=marker,tag=terf_related_$(machine_id)] Pos

execute store result score temp terf_states run data get storage terf:temp args.Pos[1]
scoreboard players remove temp terf_states 2
execute store result storage terf:temp args.Pos[1] int 1 run scoreboard players get temp terf_states

execute at @n[tag=terf_stfr] run function terf:entity/machines/stasis_laser/summon_end_crystal with storage terf:temp args

data merge block ^ ^2 ^2 {is_waxed:1b,front_text:{has_glowing_text:1b,color:green,messages:[{text:"Running",underlined:1b},"","",""]}}

scoreboard players set @a[distance=..256] terf_shake_frequency 300
scoreboard players set @a[distance=..256] terf_shake_magnitude 10

playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 5 2
playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 5 2
playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 5 2
playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 5 2
playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 5 2
playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 5 2
playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 5 2
playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 5 2
playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 5 2
playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 5 2
playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 5 2
playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 5 2

playsound terf:music.bgmusic2 master @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1

playsound terf:music.hacknet_music_end master @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1
playsound terf:music.hacknet_music_end master @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1
playsound terf:music.hacknet_music_end master @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1

stopsound @a * terf:music.hacknet_ost_panic_track
stopsound @a[distance=0..] * terf:music.hacknet_ost_paki_trak
stopsound @a * terf:music.underload_music

scoreboard players add @a[distance=..80] terf_data_P 20
