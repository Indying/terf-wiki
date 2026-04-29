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

playsound terf:music.bgmusic2 ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1
playsound terf:music.bgmusic2 ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1
playsound terf:music.bgmusic2 ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1
playsound terf:music.bgmusic2 ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1
playsound terf:music.bgmusic2 ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1
playsound terf:music.bgmusic2 ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1
playsound terf:music.bgmusic2 ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1
playsound terf:music.bgmusic2 ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1

playsound terf:music.hacknet_music_end ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1
playsound terf:music.hacknet_music_end ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1
playsound terf:music.hacknet_music_end ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1

stopsound @a * terf:music.hacknet_ost_panic_track
stopsound @a[distance=0..] * terf:music.hacknet_ost_paki_trak
stopsound @a * terf:music.underload_music

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.stasis.start',level:1,text:'{"text":"Stasis Laser Activated!"}'}

scoreboard players add @a[distance=..80] terf_data_P 20

data modify storage terf:temp args set value {arg1:"kill @e[tag=terf_overload_beam,tag=terf_related_",arg3:"]"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

data modify storage terf:temp args set value {arg1:"kill @e[tag=terf_overload_flare,tag=terf_related_",arg3:"]"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

scoreboard players set @s terf_data_E 0
scoreboard players set @s terf_data_A 10