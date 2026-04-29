$execute as @e[type=interaction,tag=terf_receptacle,tag=terf_related_$(machine_id)] unless score @s terf_data_A matches 33 run return fail
$execute as @e[type=item_display,tag=terf_receptacle,tag=terf_related_$(machine_id)] unless data entity @s {item:{components:{"minecraft:custom_model_data":{floats:[5f]}}}} run return fail
$execute as @e[type=interaction,tag=terf_receptacle,tag=terf_related_$(machine_id)] at @s unless block ^ ^.1 ^-.7 waxed_lightning_rod run return fail
execute unless data entity @s data.terf.injection_list[0] run return fail
execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep2 master @a[distance=0..] ^4 ^-2 ^-2 1 1

scoreboard players set @s terf_data_A 2
scoreboard players set @s terf_data_E 0
scoreboard players set @s terf_data_V 0
scoreboard players set @s terf_data_B 0
scoreboard players set @s terf_data_C 1
playsound terf:music.alex_giudici_reconstructing_more_science_remix_v2 ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 4 1
execute as @a[distance=..64] run function terf:entity/player/title_music {music:"Alex Giudici - Reconstructing More Science Remix v2"}

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.start.confirm',level:1,text:'{"text":"Reactor Startup Confirmed! Starting Reactor Systems..."},{"text":" Please Evacuate The Core Chamber In The Case Of A Potential Startup Failure!","color":"yellow"}'}

execute as @n[tag=terf_stfr] at @s run function terf:entity/machines/stfr/stabilizers_on
function terf:entity/machines/stfr/visuals/stabilizer/all_stab_rods_off

tag @s add terf_intensity_25
tag @s add terf_intensity_50
tag @s add terf_intensity_75
tag @s add terf_intensity_crit
tag @s remove terf_bcd_breakers
tag @s remove terf_breaker_interested
tag @s add terf_breakers_activated
