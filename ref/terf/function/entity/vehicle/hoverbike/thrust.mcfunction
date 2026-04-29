#get movement vector
execute in terf:intermediary_technical_storage_dimension positioned 0. 0 0. run summon marker ^ ^ ^1 {UUID:[I;1101100,1101101,1100001,1101111]}
execute store result score x terf_states run data get entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 Pos[0] 40
execute store result score y terf_states run data get entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 Pos[1] 40
execute store result score z terf_states run data get entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 Pos[2] 40
kill 0010cd2c-0010-cd2d-0010-c8e10010cd37

#add to velocity
scoreboard players operation @s terf_data_X += x terf_states
scoreboard players operation @s terf_data_Y += y terf_states
scoreboard players operation @s terf_data_Z += z terf_states
