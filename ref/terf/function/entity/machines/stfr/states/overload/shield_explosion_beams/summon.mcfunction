rotate @s facing ^ ^ ^1
$data merge entity @s {teleport_duration:5,interpolation_duration:5,Tags:["terf_stfr_shield_explosion","terf_related_$(machine_id)"],item:{id:"minecraft:white_concrete"},brightness:{sky:15,block:15},transformation:{scale:[0.1,0.1,0.1]}}
execute store result entity @s transformation.scale[2] float 0.1 store result entity @s transformation.translation[2] float 0.05 run scoreboard players get temp terf_states

$execute store result entity @s interpolation_duration int 1 run random value 5..$(max_duration)