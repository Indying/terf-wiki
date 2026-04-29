execute if entity @s[tag=terf_locked] run return fail

#if there is no capsule, try inserting
execute unless score @s terf_data_A matches 1.. run return run execute unless block ^ ^.1 ^-.7 waxed_lightning_rod run function terf:entity/receptacle/start_sliding_in

#if there is a capsule, and the animation is in progress, fail
execute unless score @s terf_data_A matches 33 run return fail

#get variables
scoreboard players set sneaking terf_states 0
scoreboard players set locked terf_states 0
execute on target if predicate datapipes_lib:pressing_sneak run scoreboard players set sneaking terf_states 1
$execute if data entity @n[type=item_display,tag=terf_related_$(machine_id),tag=terf_receptacle_$(rid)] {item:{components:{"minecraft:custom_model_data":{floats:[5f]}}}} run scoreboard players set locked terf_states 1

#right click
execute if score sneaking terf_states matches 0 if score locked terf_states matches 0 run execute unless block ^ ^.1 ^-.7 waxed_lightning_rod run function terf:entity/receptacle/lock_capsule with entity @s data.terf
$data modify storage terf:temp args.array set from entity @n[type=item_display,tag=terf_related_$(machine_id),tag=terf_receptacle_$(rid)] item.components.minecraft:custom_data.fluids
$execute if score sneaking terf_states matches 0 if score locked terf_states matches 0 run return run execute unless block ^ ^.1 ^-.7 waxed_lightning_rod as @n[type=marker,tag=terf_machineid_$(machine_id)] at @s unless function terf:entity/machines/capsule_interface/structure_checks run execute if function terf:entity/explosion/antimatter/attempt_explosion run function terf:entity/machines/multiblock_core_kill

#shift right click
execute if score sneaking terf_states matches 0 run return fail
execute if score locked terf_states matches 1 run return run execute unless block ^ ^.1 ^-.7 waxed_lightning_rod run function terf:entity/receptacle/unlock_capsule with entity @s data.terf
function terf:entity/receptacle/start_sliding_out with entity @s data.terf
