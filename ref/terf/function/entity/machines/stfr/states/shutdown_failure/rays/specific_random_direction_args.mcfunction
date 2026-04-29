$rotate @s facing ^$(x) ^$(y) ^2
data merge entity @s {teleport_duration:5,interpolation_duration:5,Tags:["terf_stfr_ray"],item:{id:"minecraft:white_concrete"},brightness:{sky:15,block:15},transformation:{scale:[0.1,0.1,0.1]}}
scoreboard players set @s terf_data_A 5

scoreboard players set temp terf_states 0
function terf:entity/machines/stfr/states/shutdown_failure/rays/raycast
scoreboard players add temp terf_states 4
execute store result entity @s transformation.scale[2] float 0.1 store result entity @s transformation.translation[2] float 0.05 run scoreboard players get temp terf_states
