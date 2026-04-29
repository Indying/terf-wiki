playsound terf:music.hacknet_ost_carpenter_brut ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 16 1
playsound terf:music.hacknet_ost_carpenter_brut ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 16 1
execute as @a[distance=..256] run function terf:entity/player/title_music {music:"Hacknet OST: Carpenter Brut - Roller Mobster"}

playsound terf:music.hacknet_music_end ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1
playsound terf:music.hacknet_music_end ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1
playsound terf:music.hacknet_music_end ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1

stopsound @a * terf:music.hacknet_ost_panic_track
stopsound @a[distance=0..] * terf:music.hacknet_ost_paki_trak
stopsound @a * terf:music.underload_music

data modify storage terf:temp args set value {arg1:"kill @e[tag=terf_overload_beam,tag=terf_related_",arg3:"]"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

scoreboard players set @s terf_data_E 0
scoreboard players set @s terf_data_A 11
scoreboard players set @s terf_data_Ab 0
tag @s remove terf_breakers_connected

execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep2 ambient @a[distance=0..] ~ ~ ~ 1 1