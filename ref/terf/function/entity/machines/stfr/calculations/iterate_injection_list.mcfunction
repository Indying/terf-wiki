scoreboard players set succeeded terf_states 0
scoreboard players set amount terf_states 0
$execute as @e[type=item_display,tag=terf_related_$(machine_id),tag=terf_receptacle_contains_$(id),sort=random,limit=1] at @s if block ^ ^.2 ^-.7 waxed_lightning_rod run function terf:entity/machines/stfr/calculations/remove_fuel_from_capsule with storage terf:temp array[0]
$execute if score succeeded terf_states matches 1 run function terf:entity/machines/stfr/calculations/inject_fuel {id:$(id)}

data remove storage terf:temp array[0]
function terf:entity/machines/stfr/calculations/iterate_injection_list with storage terf:temp array[0]
