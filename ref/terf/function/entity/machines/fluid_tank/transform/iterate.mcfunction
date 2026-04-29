#transform world into relative coordinates
execute store result score x terf_states run data get storage terf:temp args.array[0][0]
execute store result score y terf_states run data get storage terf:temp args.array[0][1]
execute store result score z terf_states run data get storage terf:temp args.array[0][2]

scoreboard players operation x terf_states -= x2 terf_states
scoreboard players operation y terf_states -= y2 terf_states
scoreboard players operation z terf_states -= z2 terf_states

execute store result storage terf:temp args.x int 1 run scoreboard players get x terf_states
execute store result storage terf:temp args.y int 1 run scoreboard players get y terf_states
execute store result storage terf:temp args.z int 1 run scoreboard players get z terf_states
function terf:entity/machines/fluid_tank/transform/add_if with storage terf:temp args

data remove storage terf:temp args.array[0]
execute if data storage terf:temp args.array[0] run function terf:entity/machines/fluid_tank/transform/iterate