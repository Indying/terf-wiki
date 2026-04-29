scoreboard players add @s terf_data_A 1
execute if score @s terf_data_A matches 2 run data merge entity @s {start_interpolation:0,transformation:{translation:[0f,-2f,100f],left_rotation:[3464f,10f,42f,1f],scale:[20f,20f,20f]}}
execute if score @s terf_data_A matches 10 if predicate datapipes_lib:chances/90 run data merge entity @s {start_interpolation:0,item:{id:"minecraft:yellow_stained_glass"}}
execute if score @s terf_data_A matches 17 if predicate datapipes_lib:chances/90 run data merge entity @s {start_interpolation:0,item:{id:"minecraft:orange_stained_glass"}}
execute if score @s terf_data_A matches 35 if predicate datapipes_lib:chances/90 run data merge entity @s {start_interpolation:0,item:{id:"minecraft:red_stained_glass"}}
execute if score @s terf_data_A matches 40 if predicate datapipes_lib:chances/90 run data merge entity @s {brightness:{},start_interpolation:0,item:{id:"minecraft:brown_stained_glass"}}
execute if score @s terf_data_A matches 60 run data merge entity @s {start_interpolation:0,item:{id:"minecraft:black_stained_glass"}}

execute if score @s terf_data_A matches 95.. if predicate datapipes_lib:chances/10 run kill @s
execute if score @s terf_data_A matches 150.. run kill @s