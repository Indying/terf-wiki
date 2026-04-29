#summon an item display with the same rotation and length as the next step
$summon item_display ~ ~ ~ {item:{id:"minecraft:white_concrete"},Tags:["terf_lightning"],Rotation:[$(yaw)f,$(pitch)f],transformation:{scale:[0.1f,0.1f,$(length)f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,$(hlength)f]}}

#run the step function again right at the tip of the item display
$execute if predicate datapipes_lib:chances/50 rotated $(yaw) $(pitch) positioned ^ ^ ^$(length) run function terf:require/lightning/step
