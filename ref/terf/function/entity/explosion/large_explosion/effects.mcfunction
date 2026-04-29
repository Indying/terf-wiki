scoreboard players set accuracy datapipes_lib 50000
scoreboard players operation accuracy datapipes_lib /= @s terf_data_A

execute store result entity @s data.terf.distance int 6 run scoreboard players get @s terf_data_A

data modify storage datapipes_lib:temp args.command set value 'function terf:entity/explosion/large_explosion/all_directions with entity @s data.terf'
scoreboard players set runin360degrees datapipes_lib 0
execute if score accuracy datapipes_lib matches 10.. run function datapipes_lib:require/riad with storage terf:temp args

summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_humongous_fire"],billboard:"center",text:{"text":"\ueff5","color":"#111111"},background:0,view_range:730,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_humongous_fire"],billboard:"center",text:{"text":"\ueff5","color":"#111111"},background:0,view_range:730,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_humongous_fire"],billboard:"center",text:{"text":"\ueff5","color":"#111111"},background:0,view_range:730,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_humongous_fire"],billboard:"center",text:{"text":"\ueff5","color":"#111111"},background:0,view_range:730,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_humongous_fire"],billboard:"center",text:{"text":"\ueff5","color":"#111111"},background:0,view_range:730,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
