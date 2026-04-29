scoreboard players set @s terf_data_E 0
scoreboard players set @s terf_data_A 4
tag @s add terf_core_starting_alarm
function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.shutdown.prime',level:1,text:'{"text":"Fusion Reactor Shutdown Sequence Initiated."}'}
execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep2 ambient @a[distance=0..] ~ ~ ~ 1 1

execute if score @s terf_data_U matches 1.. at @s positioned ~ ~13.5 ~ run function terf:entity/machines/stfr/emergency_controls/power_surge/abort_automatic
