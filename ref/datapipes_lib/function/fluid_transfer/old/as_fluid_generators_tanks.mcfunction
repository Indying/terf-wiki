#iterate through tanks, if they are output tanks then set their value to 0 and add them to the total_net_fluid
execute store result score tank_amount datapipes_lib run data get storage datapipes_lib:temp array[0].amount
execute if score tank_amount datapipes_lib matches 1.. if data storage datapipes_lib:temp array[0].pipe_on run function datapipes_lib:fluid_transfer/push/as_fluid_generators_tanks_checks with storage datapipes_lib:temp array[0]

data remove storage datapipes_lib:temp array[0]
execute if data storage datapipes_lib:temp array[0] run function datapipes_lib:fluid_transfer/push/as_fluid_generators_tanks
