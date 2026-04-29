$scoreboard players set amount terf_states $(amount)
$data modify storage terf:temp args set value {id:'$(id)',rid:$(rid)}
data modify storage terf:temp args.machine_id set from entity @s data.terf.machine_id
function terf:require/add_fluid_to_receptacle_args with storage terf:temp args
#after the function runs, it returns the amount of leftover fluid it couldnt insert to the container in amount terf_states