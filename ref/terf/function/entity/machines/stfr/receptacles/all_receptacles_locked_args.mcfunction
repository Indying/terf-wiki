$execute as @e[type=interaction,tag=terf_receptacle,tag=terf_related_$(machine_id)] unless score @s terf_data_A matches 33 run return fail
$execute as @e[type=item_display,tag=terf_receptacle,tag=terf_related_$(machine_id)] unless data entity @s {item:{components:{"minecraft:custom_model_data":{floats:[5f]}}}} run return fail
$execute as @e[type=interaction,tag=terf_receptacle,tag=terf_related_$(machine_id)] at @s unless block ^ ^.1 ^-.7 waxed_lightning_rod run return fail
return 1
