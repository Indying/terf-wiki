#if the tank is an output tank, and its type matches the current type, add its amount to total_amount and set it to 0
$execute if entity @s[tag=!datapipes_lib_iterative_fluid_system] run return run function datapipes_lib:fluid_transfer/push/as_generator_tank with entity @s data.fluids[{id:'$(id)'}]

data modify storage datapipes_lib:temp array2 set from entity @s data.fluids
function datapipes_lib:fluid_transfer/push/find_generator_tanks_iterate