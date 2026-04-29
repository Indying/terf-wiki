#summon an item display with the same rotation and length as the next step
$execute if score terminated terf_states matches 1.. run summon item_display ~ ~ ~ {brightness:{sky:15,block:15},item:{id:"minecraft:orange_concrete",components:{"minecraft:item_model":"terf:visual/discharge"}},Tags:["terf_bullet"],Rotation:[$(yaw)f,$(pitch)f],transformation:{scale:[0.1f,0.1f,$(length)f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,-$(length)f]}}
$execute unless score terminated terf_states matches 1.. run summon item_display ~ ~ ~ {brightness:{sky:15,block:15},item:{id:"minecraft:orange_concrete",components:{"minecraft:item_model":"terf:visual/discharge"}},Tags:["terf_bullet","terf_bullet_head"],Rotation:[$(yaw)f,$(pitch)f],transformation:{scale:[0.1f,0.1f,$(length)f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,-$(length)f]}}

#run the step function again simulating reflection
$execute if score terminated terf_states matches 1.. rotated $(ryaw) $(rpitch) positioned ^ ^ ^0.1 if loaded ~ ~ ~ run function terf:entity/vehicle/mrt/beam/step
