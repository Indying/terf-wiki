advancement grant @a[distance=..50] only terf:stfr/shutdown_failure_restab

execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep2 ambient @a[distance=0..] ~ ~ ~ 1 0.6
execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep2 ambient @a[distance=0..] ~ ~ ~ 1 0.64
execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep2 ambient @a[distance=0..] ~ ~ ~ 1 0

stopsound @a[distance=..256] * terf:music.carpenter_brut_run_sally_run
playsound terf:music.joel_nielsen_blast_pit_3 master @a[distance=0..] ~ ~ ~ 10
execute as @a[distance=..256,tag=terf_music_crediting] run function terf:entity/player/title_music {music:"Joel Nielsen: Black Mesa Soundtrack - Blast Pit 3"}

scoreboard players set @s terf_data_Ab 0
function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.shut_fail.restab_start',level:1,text:'{"text":"Shutdown Failure Restabilization Sequence Initialized!"}'}