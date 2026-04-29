data modify storage terf:temp temp set from entity @s Rotation
execute store result score rotation_x terf_states run data get entity @s Rotation[0] -1000
execute store result score rotation_y terf_states run data get entity @s Rotation[1] 1000

#rotation x
scoreboard players set target_rotation_x_360 terf_states 0
scoreboard players operation target_rotation_x_360 terf_states -= rot_x terf_states
execute if score target_rotation_x_360 terf_states matches ..1 run scoreboard players add target_rotation_x_360 terf_states 360000
execute if score rotation_x terf_states matches ..1 run scoreboard players add rotation_x terf_states 360000

scoreboard players operation rotation_difference terf_states = rotation_x terf_states
scoreboard players operation rotation_difference terf_states -= target_rotation_x_360 terf_states
execute if score rotation_difference terf_states matches ..-1 run scoreboard players add rotation_difference terf_states 360000

execute if score rotation_difference terf_states matches 180000.. run scoreboard players remove rotation_difference terf_states 360000

#rotate
scoreboard players operation rotation_y terf_states -= rot_y terf_states
$execute store result storage terf:temp args2.amount float -$(accuracy) run scoreboard players get rotation_y terf_states 
function terf:entity/vehicle/art/rotate_pitch with storage terf:temp args2

$execute store result storage terf:temp args2.amount float $(accuracy) run scoreboard players get rotation_difference terf_states
execute at @s run function terf:entity/vehicle/art/rotate with storage terf:temp args2
data modify storage terf:temp args2.amount set from entity @s Rotation[0]

execute unless score charge terf_states matches 1.. run return fail
particle minecraft:electric_spark ^ ^ ^1.4 0 0 0 0.3 10 force
particle minecraft:electric_spark ^0.07 ^ ^1.4 ^ ^ ^10000000000 0.0000000005 0 force

execute unless score charge terf_states matches 60.. run return fail
scoreboard players set temp terf_states 0
execute at @s run function terf:entity/vehicle/art/beam/raycast