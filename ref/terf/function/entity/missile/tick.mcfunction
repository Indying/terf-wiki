scoreboard players add @s terf_data_D 1
execute as @s[tag=terf_nolaunch] if score @s terf_data_D matches ..7 run scoreboard players set @s terf_data_D 8

execute if score @s terf_data_D matches 7.. run particle minecraft:flame ~ ~ ~ 0 0 0 0.05 10 force
execute if score @s terf_data_D matches 7.. run particle minecraft:explosion ~ ~ ~ 0 0 0 0 1 force
execute if score @s terf_data_D matches 7 run particle flash{color:[1,1,1,1]} ~ ~ ~ 0 0 0 0.05 1 force

scoreboard players set speed_sum terf_states 100000
scoreboard players operation temp terf_states = @s terf_data_A
execute if score temp terf_states matches ..-1 run scoreboard players operation temp terf_states /= -1 terf_states
scoreboard players operation speed_sum terf_states += temp terf_states

scoreboard players operation temp terf_states = @s terf_data_B
execute if score temp terf_states matches ..-1 run scoreboard players operation temp terf_states /= -1 terf_states
scoreboard players operation speed_sum terf_states += temp terf_states

scoreboard players operation temp terf_states = @s terf_data_C
execute if score temp terf_states matches ..-1 run scoreboard players operation temp terf_states /= -1 terf_states
scoreboard players operation speed_sum terf_states += temp terf_states

function terf:entity/missile/collision_check

function datapipes_lib:require/rotation_into_3d_vector {magnitude:5}

execute store result score temp terf_states run data get storage datapipes_lib:temp output[0] 2000
execute if score @s terf_data_D matches 7.. run scoreboard players operation @s terf_data_A += temp terf_states
execute store result score temp terf_states run data get storage datapipes_lib:temp output[1] 2000
execute if score @s terf_data_D matches 7.. run scoreboard players operation @s terf_data_B += temp terf_states
execute store result score temp terf_states run data get storage datapipes_lib:temp output[2] 2000
execute if score @s terf_data_D matches 7.. run scoreboard players operation @s terf_data_C += temp terf_states

execute as @s[tag=terf_launch] run function terf:entity/missile/he_spawned

scoreboard players remove @s terf_data_B 2000

#execute store result storage terf:temp args.x float 0.000001 run data get storage datapipes_lib:temp output[0] -100000
#execute store result storage terf:temp args.y float 0.000001 run data get storage datapipes_lib:temp output[1] -100000
#execute store result storage terf:temp args.z float 0.000001 run data get storage datapipes_lib:temp output[2] -100000
#function terf:entity/missile/particle with storage terf:temp args

execute store result storage terf:temp args.x float 0.00001 run scoreboard players get @s terf_data_A
execute store result storage terf:temp args.y float 0.00001 run scoreboard players get @s terf_data_B
execute store result storage terf:temp args.z float 0.00001 run scoreboard players get @s terf_data_C
function terf:entity/missile/move with storage terf:temp args