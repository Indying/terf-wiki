scoreboard players set @s terf_data_U 3
scoreboard players set @s terf_data_Ab 5
function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.manual_restab.confirm',level:1,text:'{"text":"Fusion Reactor Restabilization Confirmed. Commincing A Reactor Power Surge For Auxilary Field Compression..."}'}
tag @s add terf_stfr_surge_unabortable
stopsound @a * terf:music.hacknet_ost_carpenter_brut
playsound terf:music.restabilization_music ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 15 1
