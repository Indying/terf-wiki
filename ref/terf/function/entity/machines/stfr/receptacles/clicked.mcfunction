#try inserting capsule
execute unless score @s terf_data_A matches 1.. run execute unless block ^ ^.1 ^-.7 waxed_lightning_rod run function terf:entity/receptacle/start_sliding_in

#allow to shutdown/restart the stabilizer if it has no capsule
$execute unless score @s terf_data_A matches 1.. unless block ^ ^.1 ^-.7 waxed_lightning_rod run execute at @n[type=marker,tag=terf_stfr,tag=terf_machineid_$(machine_id)] run function terf:entity/machines/stfr/receptacles/restart_stabilizer with entity @s data.terf
$execute unless score @s terf_data_A matches 1.. run return run execute if block ^ ^.1 ^-.7 waxed_lightning_rod run execute at @n[type=marker,tag=terf_stfr,tag=terf_machineid_$(machine_id)] run function terf:entity/machines/stfr/receptacles/shutdown_stabilizer with entity @s data.terf

#if there is a capsule, and the animation is in progress, fail
execute unless score @s terf_data_A matches 33 run return fail

#get variables
scoreboard players set sneaking terf_states 0
scoreboard players set locked terf_states 0
execute on target if predicate datapipes_lib:pressing_sneak run scoreboard players set sneaking terf_states 1
$execute if data entity @n[type=item_display,tag=terf_related_$(machine_id),tag=terf_receptacle_$(rid)] {item:{components:{"minecraft:custom_model_data":{floats:[5f]}}}} run scoreboard players set locked terf_states 1

#right click
execute if score sneaking terf_states matches 0 if score locked terf_states matches 0 run return run execute unless block ^ ^.1 ^-.7 waxed_lightning_rod run function terf:entity/receptacle/lock_capsule with entity @s data.terf
$execute if score sneaking terf_states matches 0 run return run execute unless block ^ ^.1 ^-.7 waxed_lightning_rod at @n[type=marker,tag=terf_stfr,tag=terf_machineid_$(machine_id)] run function terf:entity/machines/stfr/receptacles/restart_stabilizer with entity @s data.terf

#shift right click
execute if score sneaking terf_states matches 0 run return fail

#if unobstructed
$execute unless block ^ ^.1 ^-.7 waxed_lightning_rod if score locked terf_states matches 1 run return run function terf:entity/receptacle/unlock_capsule {rid:$(rid),machine_id:$(machine_id)}
execute unless block ^ ^.1 ^-.7 waxed_lightning_rod run function terf:entity/receptacle/start_sliding_out with entity @s data.terf
execute if block ^ ^.1 ^-.7 waxed_lightning_rod if score locked terf_states matches 0 run function terf:entity/receptacle/start_sliding_out with entity @s data.terf

#only shutdown the stabilizer if every capsule is properly inserted and locked and the breakers are on
$execute if entity @n[type=marker,tag=terf_stfr,tag=terf_machineid_$(machine_id),tag=terf_breakers_activated] unless function terf:entity/machines/stfr/receptacles/all_receptacles_locked run return fail

$execute if score locked terf_states matches 1 if block ^ ^.1 ^-.7 waxed_lightning_rod run execute at @n[type=marker,tag=terf_stfr,tag=terf_machineid_$(machine_id)] run function terf:entity/machines/stfr/receptacles/shutdown_stabilizer with entity @s data.terf
