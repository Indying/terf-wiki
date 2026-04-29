particle minecraft:flame ~ ~ ~ 0 0 0 0.1 1
particle minecraft:lava ~ ~ ~ 0 0 0 0.1 1
particle minecraft:dust_color_transition{from_color:[1,0,0],to_color:[1,1,0],scale:4} ~ ~ ~ 0 0 0 0 1 force

execute if score @s terf_data_E matches 60.. run particle minecraft:explosion ~ ~ ~
execute if score @s terf_data_E matches 60.. run particle minecraft:electric_spark ~ ~ ~ 0 0 0 3 20
execute if score @s terf_data_E matches 60..70 run particle flash{color:[1,1,1,1]} ~ ~ ~ 0.1 0.1 0.1 10 1
execute if score @s terf_data_E matches 60 run particle minecraft:flame ~ ~ ~ 0 0 0 1 1000
