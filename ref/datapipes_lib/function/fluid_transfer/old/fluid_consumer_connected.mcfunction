#attempt to get the tank of this entity
$execute if score total_amount datapipes_lib matches 1.. run function datapipes_lib:fluid_transfer/push/fluid_consumer_checks with entity @s data.fluids[{id:'$(id)'}]
