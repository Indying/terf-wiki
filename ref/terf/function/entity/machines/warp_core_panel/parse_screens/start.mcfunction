execute store result storage terf:temp args.max_size int 1 run scoreboard players get warp_core_max_size terf_states

execute positioned ^-2 ^3 ^-1 run function terf:entity/machines/warp_core_panel/parse_screens/screen_negative_ship_size with storage terf:temp args
execute positioned ^-1 ^3 ^-1 run function terf:entity/machines/warp_core_panel/parse_screens/screen_positive_ship_size with storage terf:temp args

#default target coords if they are invalid on the panel
execute store result storage terf:temp args.x int 1 store result score dx terf_states run data get entity @s Pos[0]
execute store result score dy terf_states run data get entity @s Pos[1]
scoreboard players operation dy terf_states -= @s terf_data_S
execute store result storage terf:temp args.y int 1 run scoreboard players get dy terf_states
execute store result storage terf:temp args.z int 1 store result score dz terf_states run data get entity @s Pos[2]

execute positioned ^1 ^3 ^-1 run function terf:entity/machines/warp_core_panel/parse_screens/screen_target_coords with storage terf:temp args
execute positioned ^2 ^3 ^-1 run function terf:entity/machines/warp_core_panel/parse_screens/screen_target_dimension
