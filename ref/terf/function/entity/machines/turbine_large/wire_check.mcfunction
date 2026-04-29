tag @s add terf_outputed
execute if block ^3 ^ ^-1 granite_slab[type=double] run scoreboard players add x terf_states 3
execute if block ^-3 ^ ^-1 granite_slab[type=double] run scoreboard players remove x terf_states 3
execute if block ^ ^3 ^-1 granite_slab[type=double] run scoreboard players add y terf_states 3
execute if block ^ ^-3 ^-1 granite_slab[type=double] run scoreboard players remove y terf_states 3

execute if score z terf_states matches 1.. run scoreboard players operation x terf_states /= -1 terf_states

execute store result storage terf:temp args.z int 1 run scoreboard players get z terf_states
execute store result storage terf:temp args.y int 1 run scoreboard players get y terf_states
execute store result storage terf:temp args.x int 1 run scoreboard players get x terf_states
function terf:entity/machines/turbine_large/power_config with storage terf:temp args