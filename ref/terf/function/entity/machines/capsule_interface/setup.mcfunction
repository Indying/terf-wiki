data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/capsule_interface/tick'

$execute positioned ^ ^1 ^-1 positioned ~1 ~ ~ if block ~ ~ ~ chiseled_polished_blackstone run return run function terf:entity/machines/capsule_interface/add_receptacle {yaw:270,machine_id:$(machine_id)}
$execute positioned ^ ^1 ^-1 positioned ~-1 ~ ~ if block ~ ~ ~ chiseled_polished_blackstone run return run function terf:entity/machines/capsule_interface/add_receptacle {yaw:90,machine_id:$(machine_id)}
$execute positioned ^ ^1 ^-1 positioned ~ ~ ~1 if block ~ ~ ~ chiseled_polished_blackstone run return run function terf:entity/machines/capsule_interface/add_receptacle {yaw:0,machine_id:$(machine_id)}
$execute positioned ^ ^1 ^-1 positioned ~ ~ ~-1 if block ~ ~ ~ chiseled_polished_blackstone run function terf:entity/machines/capsule_interface/add_receptacle {yaw:180,machine_id:$(machine_id)}
