function datapipes_lib:require/rotation_into_3d_vector {magnitude:5}

execute store result score temp terf_states run data get storage datapipes_lib:temp output[0] 20000
scoreboard players operation @s terf_data_A += temp terf_states
execute store result score temp terf_states run data get storage datapipes_lib:temp output[1] 20000
scoreboard players operation @s terf_data_B += temp terf_states
execute store result score temp terf_states run data get storage datapipes_lib:temp output[2] 20000
scoreboard players operation @s terf_data_C += temp terf_states

tag @s remove terf_launch