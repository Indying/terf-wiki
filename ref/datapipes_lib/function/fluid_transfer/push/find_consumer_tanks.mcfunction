#particle campfire_signal_smoke
#$say $(id)
#if the tanks type matches the current type, add total_amount to it
$execute if entity @s[tag=!datapipes_lib_iterative_fluid_system] run return run execute if score total_amount datapipes_lib matches 1.. run function datapipes_lib:fluid_transfer/push/as_consumer_tank with entity @s data.fluids[{id:'$(id)'}]

data modify storage datapipes_lib:temp array2 set from entity @s data.fluids
function datapipes_lib:fluid_transfer/push/find_consumer_tanks_iterate