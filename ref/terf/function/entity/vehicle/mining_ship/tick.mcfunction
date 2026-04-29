#terf_data_A: forwards velocity
#terf_data_B: previous collision
#terf_data_C: charge
#terf_data_D: damage
#terf_data_E: driver_rotation_x
#terf_data_F: driver_rotation_y
#terf_data_G: alternate shots

#interactions
scoreboard players set right_click_iron terf_states 0
scoreboard players set right_click terf_states 0
scoreboard players set left_click terf_states 0

data remove storage terf:temp temp
data remove storage terf:temp temp2
scoreboard players operation damage terf_states = @s terf_data_D
scoreboard players operation damage terf_states /= 1000 terf_states
scoreboard players operation speed terf_states = @s terf_data_A
scoreboard players operation charge terf_states = @s terf_data_C
execute on passengers at @s[type=minecraft:player] run function terf:entity/vehicle/mining_ship/as_driver
execute on passengers as @s[type=minecraft:interaction] run function terf:entity/vehicle/mining_ship/as_click_detector
execute if score right_click_iron terf_states matches 1 run scoreboard players remove @s terf_data_D 10000
execute if score @s terf_data_D matches ..0 run scoreboard players set @s terf_data_D 0

#logik
execute unless score @s terf_data_C matches 500.. run scoreboard players add @s terf_data_C 1
execute if data storage terf:temp temp2[0] run function terf:entity/vehicle/mining_ship/operation
execute unless data storage terf:temp temp2[0] unless score @s terf_data_A matches 0 on passengers as @s[type=area_effect_cloud] on passengers on passengers at @s run function terf:entity/vehicle/mining_ship/as_item_display
execute unless data storage terf:temp temp2[0] unless score @s terf_data_A matches 0 run function terf:entity/vehicle/mining_ship/movement
execute unless data storage terf:temp temp2[0] if score @s terf_data_A matches 0 if block ~ ~-0.5 ~ #terf:no_collision run tp @s ~ ~-0.1 ~