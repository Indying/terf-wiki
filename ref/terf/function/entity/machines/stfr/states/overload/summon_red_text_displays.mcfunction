summon minecraft:text_display ~.1 ~ ~ {Tags:["terf_currententity","terf_overload_flare"],text:{"text":"\ueef2","color":"#FF0000"},background:0,billboard:"center",interpolation_duration:30,text_opacity:4,brightness:{sky:15,block:15},alignment:center}
summon minecraft:text_display ~ ~.1 ~ {Tags:["terf_currententity","terf_overload_flare"],text:{"text":"\ueef2","color":"#FF0000"},background:0,billboard:"center",interpolation_duration:30,text_opacity:4,brightness:{sky:15,block:15},alignment:center}
summon minecraft:text_display ~ ~ ~.1 {Tags:["terf_currententity","terf_overload_flare"],text:{"text":"\ueef2","color":"#FF0000"},background:0,billboard:"center",interpolation_duration:30,text_opacity:4,brightness:{sky:15,block:15},alignment:center}
summon minecraft:text_display ~-.1 ~ ~ {Tags:["terf_currententity","terf_overload_flare"],text:{"text":"\ueef2","color":"#FF0000"},background:0,billboard:"center",interpolation_duration:30,text_opacity:4,brightness:{sky:15,block:15},alignment:center}
summon minecraft:text_display ~ ~-.1 ~ {Tags:["terf_currententity","terf_overload_flare"],text:{"text":"\ueef2","color":"#FF0000"},background:0,billboard:"center",interpolation_duration:30,text_opacity:4,brightness:{sky:15,block:15},alignment:center}
summon minecraft:text_display ~ ~ ~-.1 {Tags:["terf_currententity","terf_overload_flare"],text:{"text":"\ueef2","color":"#FF0000"},background:0,billboard:"center",interpolation_duration:30,text_opacity:4,brightness:{sky:15,block:15},alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_currententity","terf_overload_flare"],text:{"text":"\ueef2","color":"#FF00000"},background:0,billboard:"center",interpolation_duration:10,text_opacity:4,brightness:{sky:15,block:15},alignment:center}

data modify storage terf:temp args set value {arg1:'tag @e[tag=terf_currententity] add terf_related_'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
execute at @s run function datapipes_lib:require/with_args/2 with storage terf:temp args

tag @e remove terf_currententity