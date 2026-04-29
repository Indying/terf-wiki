$execute positioned $(x) $(y) $(z) align xyz run function terf:entity/machines/pressurizer/setblock_air

#continue iterating
data remove storage terf:temp array[0]
data modify storage terf:temp args.x set from storage terf:temp array[0][0]
data modify storage terf:temp args.y set from storage terf:temp array[0][1]
data modify storage terf:temp args.z set from storage terf:temp array[0][2]
execute if data storage terf:temp array[0] run function terf:entity/machines/pressurizer/array_iterate with storage terf:temp args