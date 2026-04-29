$data merge entity @s {Tags:["terf_stfr_meltdown_dust","terf_related_$(machine_id)"],text:{text:"\ueff5",color:"#C9DAFF"},background:0,teleport_duration:3,text_opacity:70,billboard:center}
execute store result entity @s Rotation[0] float 0.001 run random value 1..360000
execute store result entity @s Rotation[1] float 0.001 run random value -90000..90000

scoreboard players set @s terf_data_A 1000
scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches 1.. summon text_display run function terf:entity/machines/stfr/states/meltdown/dust/summon with storage terf:temp args