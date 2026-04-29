#find match
execute store success score succeeded datapipes_lib run data modify storage datapipes_lib:temp array2[0].id set from storage datapipes_lib:temp array[0].id
execute if score succeeded datapipes_lib matches 0 run function datapipes_lib:fluid_transfer/push/as_consumer_tank with storage datapipes_lib:temp array2[0]

#continue iterating
data remove storage datapipes_lib:temp array2[0]
execute if data storage datapipes_lib:temp array2[0] run function datapipes_lib:fluid_transfer/push/find_consumer_tanks_iterate