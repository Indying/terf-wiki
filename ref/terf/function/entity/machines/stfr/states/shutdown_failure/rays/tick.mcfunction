scoreboard players add @s terf_data_A 1

execute if score @s terf_data_A matches 13.. run kill @s
execute if score @s terf_data_A matches 8 run function terf:entity/machines/stfr/states/shutdown_failure/rays/transform
execute unless score @s terf_data_A matches 3 run return fail

scoreboard players set temp terf_states 0
function terf:entity/machines/stfr/states/shutdown_failure/rays/raycast

execute store result entity @s transformation.scale[2] float 0.1 store result entity @s transformation.translation[2] float 0.05 run scoreboard players get temp terf_states
