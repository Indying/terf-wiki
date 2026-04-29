#terf_data_A: forwards velocity
#terf_data_B: previous collision
#terf_data_C: charge
#terf_data_D: damage
#terf_data_E: driver_rotation_x
#terf_data_F: driver_rotation_y
#terf_data_G: alternate shots

execute store result score @s terf_data_E run data get storage terf:temp temp2[0] 1000
execute store result score @s terf_data_F run data get storage terf:temp temp2[1] 1000

execute unless score @s terf_data_G = @s terf_data_G run scoreboard players set @s terf_data_G 1
scoreboard players operation alternate terf_states = @s terf_data_G
execute if score left_click terf_states matches 1 if score charge terf_states matches 25.. run scoreboard players operation @s terf_data_G /= -1 terf_states
execute if score left_click terf_states matches 1 if score charge terf_states matches 25.. run scoreboard players remove @s terf_data_C 25
execute if score @s terf_data_C matches ..-1 run scoreboard players set @s terf_data_C 0

data modify storage terf:temp temp set from entity @s Rotation
execute store result score rotation_x terf_states run data get entity @s Rotation[0] 1000
execute store result score rotation_y terf_states run data get entity @s Rotation[1] 1000

#rotation y
scoreboard players operation temp terf_states = rotation_y terf_states
scoreboard players operation temp terf_states -= @s terf_data_F
scoreboard players operation temp terf_states /= 10 terf_states

scoreboard players operation rotation_y terf_states -= temp terf_states

#rotation x
scoreboard players operation driver_rotation_x_360 terf_states = @s terf_data_E

scoreboard players operation rotation_x_360 terf_states = rotation_x terf_states
execute if score driver_rotation_x_360 terf_states matches ..1 run scoreboard players add driver_rotation_x_360 terf_states 360000
execute if score rotation_x_360 terf_states matches ..1 run scoreboard players add rotation_x_360 terf_states 360000

scoreboard players operation rotation_difference terf_states = rotation_x_360 terf_states
scoreboard players operation rotation_difference terf_states -= driver_rotation_x_360 terf_states
execute if score rotation_difference terf_states matches ..-1 run scoreboard players add rotation_difference terf_states 360000

scoreboard players operation rotation_difference terf_states = rotation_difference terf_states
execute if score rotation_difference terf_states matches 180000.. run scoreboard players remove rotation_difference terf_states 360000
scoreboard players operation rotation_difference terf_states /= 10 terf_states

scoreboard players operation rotation_x terf_states -= rotation_difference terf_states

execute unless score @s terf_data_D matches 100000.. store result storage terf:temp temp[0] float 0.001 run scoreboard players get rotation_x terf_states
execute unless score @s terf_data_D matches 100000.. store result storage terf:temp temp[1] float 0.001 run scoreboard players get rotation_y terf_states

data modify entity @s Rotation set from storage terf:temp temp
execute on passengers as @s[type=area_effect_cloud] on passengers on passengers at @s run function terf:entity/vehicle/mining_ship/as_item_display

#interactions
execute if score right_click terf_states matches 1 run scoreboard players add @s terf_data_A 1000

#movement
function terf:entity/vehicle/mining_ship/movement
