scoreboard players set @s terf_data_U 3
scoreboard players set @s terf_data_E 0

tag @s add terf_stfr_surge_unabortable
tag @s add terf_startup_overload_stabilizing

execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep2 ambient @a[distance=0..] ~ ~ ~ 1 1
function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.restab_start',level:1,text:'{"text":"Fusion Reactor Core Startup Overload Restabilization Protocol Has Been Initiated!"}'}

data modify storage terf:temp args set value {arg1:'execute as @e[type=minecraft:item_display,tag=terf_stfr_so_beam,tag=terf_related_',arg3:'] run function terf:entity/machines/stfr/states/startup_overload/as_beam_calm'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
execute if score @s terf_data_E matches 783.. run function datapipes_lib:require/with_args/3 with storage terf:temp args

stopsound @a[distance=..512] * terf:music.idunno_reactor_meltdown_sequence
playsound terf:music.hacknet_music_end ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1

#playsound terf:music.bgmusic2 ui @a[distance=0..] ~ ~ ~ 16 1.2
#playsound terf:music.bgmusic2 ui @a[distance=0..] ~ ~ ~ 16 1.2
#playsound terf:music.bgmusic2 ui @a[distance=0..] ~ ~ ~ 16 1.2
#playsound terf:music.bgmusic2 ui @a[distance=0..] ~ ~ ~ 16 1.2
#playsound terf:music.bgmusic2 ui @a[distance=0..] ~ ~ ~ 16 1.2
#playsound terf:music.bgmusic2 ui @a[distance=0..] ~ ~ ~ 16 1.2
#playsound terf:music.bgmusic2 ui @a[distance=0..] ~ ~ ~ 16 1.2
#playsound terf:music.bgmusic2 ui @a[distance=0..] ~ ~ ~ 16 1.2

tag @s remove terf_core_starting_alarm