data modify storage terf:temp args set value {pitch:0,command:'summon minecraft:item_display ^ ^300 ^100 {data:{terf:{destruction_override:"function terf:entity/meteor/destruction_override"}},Rotation:[0f,90f],item:{id:"minecraft:cobblestone"},teleport_duration:2,Tags:["terf_meteor_small","terf_meteor","terf_art_lock","terf_art_target"],interpolation_duration:5,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]}}'}
$execute if predicate datapipes_lib:chances/$(large_chance) run data modify storage terf:temp args set value {pitch:0,command:'summon minecraft:item_display ^ ^300 ^100 {data:{terf:{destruction_override:"function terf:entity/meteor/destruction_override"}},Rotation:[0f,90f],item:{id:"minecraft:magma_block"},teleport_duration:2,Tags:["terf_meteor_large","terf_meteor","terf_art_lock","terf_art_target"],interpolation_duration:5,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]}}'}
execute if block ~ ~-1 ~ cobblestone run data modify storage terf:temp args set value {pitch:0,command:'summon minecraft:item_display ^ ^300 ^100 {data:{terf:{destruction_override:"function terf:entity/meteor/destruction_override"}},Rotation:[0f,90f],item:{id:"minecraft:magma_block"},teleport_duration:2,Tags:["terf_meteor_large","terf_meteor","terf_art_lock","terf_art_target"],interpolation_duration:5,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]}}'}

execute store result storage terf:temp args.yaw float 0.001 run random value -180000..180000
function datapipes_lib:require/run_rotated with storage terf:temp args

rotate @n[type=minecraft:item_display,tag=terf_meteor,tag=!terf_rotated_meteor] facing ~ ~ ~
tag @e[type=minecraft:item_display,tag=terf_meteor,tag=!terf_rotated_meteor] add terf_rotated_meteor

playsound terf:rumbling master @a[distance=0..] ^ ^400 ^100 40