$tag @s remove terf_capsule_$(rid)_locked

$execute unless data entity @n[type=item_display,tag=terf_receptacle_$(rid),tag=terf_related_$(machine_id)] {item:{components:{"minecraft:custom_model_data":{floats:[5.0f]}}}} run return fail

$data modify entity @n[type=item_display,tag=terf_receptacle_$(rid),tag=terf_related_$(machine_id)] item.components.minecraft:custom_model_data.floats[0] set value 0
$data modify entity @n[type=item_display,tag=terf_receptacle_$(rid),tag=terf_related_$(machine_id)] item.components.minecraft:custom_data.terf.capsule_contents set from entity @n[type=item_display,tag=terf_receptacle_$(rid),tag=terf_related_$(machine_id)] item.components.minecraft:custom_data.fluids 
$data remove entity @n[type=item_display,tag=terf_receptacle_$(rid),tag=terf_related_$(machine_id)] item.components.minecraft:custom_data.fluids
$execute at @n[type=item_display,tag=terf_receptacle_$(rid),tag=terf_related_$(machine_id)] run function terf:require/play_with_random_pitch {s:'terf:clack_out master @a[distance=0..] ~ ~ ~ 1',min:6000,max:7500}