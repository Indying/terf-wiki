$execute as @e[type=item_display,tag=terf_receptacle,tag=terf_related_$(machine_id)] unless data entity @s item.components.minecraft:custom_data.fluids[{id:"water"}] run return fail
return 1
