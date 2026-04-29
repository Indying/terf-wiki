execute unless predicate datapipes_lib:can_see_sky run return fail
execute unless block ~ ~ ~ air run return fail
scoreboard players set length terf_states 0
function terf:entity/meteor/spawn_space_raycast
execute unless score length terf_states matches 200.. run return fail

execute store result score temp terf_states run random value 1..100
execute if score temp terf_states matches 1..90 run summon minecraft:item_display ~ ~ ~ {data:{terf:{destruction_override:"function terf:entity/meteor/destruction_override"}},Rotation:[0f,90f],item:{id:"minecraft:heavy_weighted_pressure_plate"},teleport_duration:2,Tags:["terf_space_debris","terf_meteor"],interpolation_duration:5,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]}}
execute if score temp terf_states matches 91..98 run summon minecraft:item_display ~ ~ ~ {data:{terf:{destruction_override:"function terf:entity/meteor/destruction_override"}},Rotation:[0f,90f],item:{id:"minecraft:cobblestone"},teleport_duration:2,Tags:["terf_meteor_small","terf_meteor","terf_art_lock","terf_art_target"],interpolation_duration:5}
execute if score temp terf_states matches 99..100 run summon minecraft:item_display ~ ~ ~ {data:{terf:{destruction_override:"function terf:entity/meteor/destruction_override"}},Rotation:[0f,90f],item:{id:"minecraft:magma_block"},teleport_duration:2,Tags:["terf_meteor_large","terf_meteor","terf_art_lock","terf_art_target"],interpolation_duration:5,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2f,2f,2f]}}

rotate @n[type=minecraft:item_display,tag=terf_meteor,tag=!terf_rotated_meteor] facing ^ ^ ^-1

tag @e[type=minecraft:item_display,tag=terf_meteor,tag=!terf_rotated_meteor] add terf_rotated_meteor
