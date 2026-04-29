data modify storage terf:temp args set value {y:0,command:'execute positioned over world_surface unless block ~ ~-1 ~ #minecraft:air run function terf:entity/meteor/spawn_end {large_chance:10}'}
execute store result storage terf:temp args.x float 1 run random value -128..128
execute store result storage terf:temp args.z float 1 run random value -128..128
function datapipes_lib:require/run_relative with storage terf:temp args
