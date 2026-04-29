tag @s add terf_core_online

playsound terf:music.carpenter_brut_run_sally_run master @a[distance=0..] ~ ~ ~ 10
execute as @a[distance=..256,tag=terf_music_crediting] run function terf:entity/player/title_music {music:"Carpenter Brut: Run Sally, Run"}

function terf:entity/machines/stfr/stabilizers_on

tag @s add terf_stfr_opshield
function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.shut_fail.start',level:1,text:'{"text":"Cannot Continue Fusion Reactor Shutdown Sequence: ","color":"red"},{"text":"Stabilizer Shutdown Failure!","color":"gold"}'}

scoreboard players set @s terf_data_A 17
scoreboard players set @s terf_data_E 0
scoreboard players set @s terf_data_Af 0
scoreboard players set @s terf_data_Ab -1

$summon minecraft:text_display ~ ~.2 ~ {Tags:["terf_related_$(machine_id)","terf_shutdown_failure_glow"],text:{text:"\ueef2",color:"#FF00FF"},background:0,billboard:"center",interpolation_duration:10,text_opacity:25,brightness:{sky:15,block:15},alignment:center,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[.4f,.4f,.4f]}}
$summon minecraft:text_display ~.1 ~.2 ~ {Tags:["terf_related_$(machine_id)","terf_shutdown_failure_glow"],text:{text:"\ueef2",color:"#FF00FF"},background:0,billboard:"center",interpolation_duration:10,text_opacity:25,brightness:{sky:15,block:15},alignment:center,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[.4f,.4f,.4f]}}
$summon minecraft:text_display ~ ~.3 ~ {Tags:["terf_related_$(machine_id)","terf_shutdown_failure_glow"],text:{text:"\ueef2",color:"#FF00FF"},background:0,billboard:"center",interpolation_duration:10,text_opacity:25,brightness:{sky:15,block:15},alignment:center,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[.4f,.4f,.4f]}}
$summon minecraft:text_display ~ ~.2 ~.1 {Tags:["terf_related_$(machine_id)","terf_shutdown_failure_glow"],text:{text:"\ueef2",color:"#FF00FF"},background:0,billboard:"center",interpolation_duration:10,text_opacity:25,brightness:{sky:15,block:15},alignment:center,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[.4f,.4f,.4f]}}
$summon minecraft:text_display ~-.1 ~.2 ~ {Tags:["terf_related_$(machine_id)","terf_shutdown_failure_glow"],text:{text:"\ueef2",color:"#FF00FF"},background:0,billboard:"center",interpolation_duration:10,text_opacity:25,brightness:{sky:15,block:15},alignment:center,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[.4f,.4f,.4f]}}
$summon minecraft:text_display ~ ~.1 ~ {Tags:["terf_related_$(machine_id)","terf_shutdown_failure_glow"],text:{text:"\ueef2",color:"#FF00FF"},background:0,billboard:"center",interpolation_duration:10,text_opacity:25,brightness:{sky:15,block:15},alignment:center,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[.4f,.4f,.4f]}}
$summon minecraft:text_display ~ ~.2 ~-.1 {Tags:["terf_related_$(machine_id)","terf_shutdown_failure_glow"],text:{text:"\ueef2",color:"#FF00FF"},background:0,billboard:"center",interpolation_duration:10,text_opacity:25,brightness:{sky:15,block:15},alignment:center,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[.4f,.4f,.4f]}}

#$summon text_display ~ ~ ~ {Tags:["terf_stfr_shutdown_fail_flare","terf_related_$(machine_id)"],text:{text:"\ueef6",color:"#FF88FF"},see_through:1b,billboard:center,background:0,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[50f,50f,50f]},alignment:vertical,text_opacity:24}
$summon text_display ~ ~ ~ {Tags:["terf_stfr_shutdown_fail_flare","terf_related_$(machine_id)"],text:{text:"\ueef6",color:"#FF88FF"},billboard:center,background:0,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[50f,50f,50f]},alignment:vertical,text_opacity:24}

advancement grant @a[distance=..80] only terf:stfr/shutdown_failure
