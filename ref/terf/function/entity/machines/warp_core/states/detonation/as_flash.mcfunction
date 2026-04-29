scoreboard players add @s terf_data_A 1
execute if score @s terf_data_A matches 5 run data merge entity @s {start_interpolation:0,transformation:{scale:[200f,200f,200f]}}

execute if score @s terf_data_A matches 20.. run kill @s