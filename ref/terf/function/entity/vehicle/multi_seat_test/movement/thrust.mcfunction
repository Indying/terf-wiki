#get movement vector
execute in terf:intermediary_technical_storage_dimension positioned 0. 0 0. run summon marker ^ ^ ^1 {UUID:[I;1101100,1101101,1100001,1101111]}
execute store result score x terf_states run data get entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 Pos[0] 100
execute store result score y terf_states run data get entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 Pos[1] 100
execute store result score z terf_states run data get entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 Pos[2] 100
kill 0010cd2c-0010-cd2d-0010-c8e10010cd37

#add to velocity
scoreboard players operation @s terf_data_X += x terf_states
scoreboard players operation @s terf_data_Y += y terf_states
scoreboard players operation @s terf_data_Z += z terf_states

playsound block.sand.break master @a[distance=0..] ~ ~ ~ 1 0
playsound block.sand.break master @a[distance=0..] ~ ~ ~ 1 2

return fail
data modify storage terf:temp args set value {command:'particle minecraft:flame ~ ~ ~ ^ ^ ^-50000000000 0.00000000001 0 force'}
execute store result storage terf:temp args.yaw float 1 run random value -10..10
execute store result storage terf:temp args.pitch float 1 run random value -10..10
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

execute store result storage terf:temp args.yaw float 1 run random value -10..10
execute store result storage terf:temp args.pitch float 1 run random value -10..10
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

execute store result storage terf:temp args.yaw float 1 run random value -10..10
execute store result storage terf:temp args.pitch float 1 run random value -10..10
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

execute store result storage terf:temp args.yaw float 1 run random value -10..10
execute store result storage terf:temp args.pitch float 1 run random value -10..10
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

execute store result storage terf:temp args.yaw float 1 run random value -10..10
execute store result storage terf:temp args.pitch float 1 run random value -10..10
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

execute store result storage terf:temp args.yaw float 1 run random value -10..10
execute store result storage terf:temp args.pitch float 1 run random value -10..10
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

execute store result storage terf:temp args.yaw float 1 run random value -10..10
execute store result storage terf:temp args.pitch float 1 run random value -10..10
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

execute store result storage terf:temp args.yaw float 1 run random value -10..10
execute store result storage terf:temp args.pitch float 1 run random value -10..10
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

execute store result storage terf:temp args.yaw float 1 run random value -10..10
execute store result storage terf:temp args.pitch float 1 run random value -10..10
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

execute store result storage terf:temp args.yaw float 1 run random value -10..10
execute store result storage terf:temp args.pitch float 1 run random value -10..10
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

execute store result storage terf:temp args.yaw float 1 run random value -10..10
execute store result storage terf:temp args.pitch float 1 run random value -10..10
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

execute store result storage terf:temp args.yaw float 1 run random value -10..10
execute store result storage terf:temp args.pitch float 1 run random value -10..10
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

