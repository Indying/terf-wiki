execute store result storage terf:temp args.x float 0.001 run scoreboard players get @s terf_data_X
execute store result storage terf:temp args.y float 0.001 run scoreboard players get @s terf_data_Y
execute store result storage terf:temp args.z float 0.001 run scoreboard players get @s terf_data_Z


scoreboard players operation @s[tag=!terf_noslow] terf_data_X *= 9 terf_states
scoreboard players operation @s[tag=!terf_noslow] terf_data_Y *= 9 terf_states
scoreboard players operation @s[tag=!terf_noslow] terf_data_Z *= 9 terf_states

scoreboard players operation @s[tag=!terf_noslow] terf_data_X /= 10 terf_states
scoreboard players operation @s[tag=!terf_noslow] terf_data_Y /= 10 terf_states
scoreboard players operation @s[tag=!terf_noslow] terf_data_Z /= 10 terf_states

function datapipes_lib:require/move_velocity with storage terf:temp args
