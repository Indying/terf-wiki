execute store result entity @s Rotation[0] float 0.001 run random value 1..360000
execute store result entity @s Rotation[1] float 0.001 run random value -90000..90000
data merge entity @s {teleport_duration:5,interpolation_duration:5,Tags:["terf_stfr_ray"],item:{id:"minecraft:white_concrete"},brightness:{sky:15,block:15},transformation:{scale:[0.1,0.1,0.1]}}

scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches 1.. summon item_display run function terf:entity/machines/stfr/states/shutdown_failure/rays/summon

#$execute store result entity @s interpolation_duration int 1 run random value 5..$(max_duration)