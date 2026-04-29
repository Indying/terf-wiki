execute on passengers rotated as @s on vehicle run rotate @s ~ ~




execute on passengers if predicate datapipes_lib:pressing_forwards rotated as @s on vehicle run function terf:entity/vehicle/multi_seat_test/movement/thrust
execute on passengers if predicate datapipes_lib:pressing_backwards rotated as @s rotated ~ ~180 on vehicle run function terf:entity/vehicle/multi_seat_test/movement/thrust

execute on passengers if predicate datapipes_lib:pressing_jump rotated as @s rotated ~ ~-90 on vehicle run function terf:entity/vehicle/multi_seat_test/movement/thrust
execute on passengers if predicate datapipes_lib:pressing_sprint rotated as @s rotated ~ ~90 on vehicle run function terf:entity/vehicle/multi_seat_test/movement/thrust

execute on passengers if predicate datapipes_lib:pressing_left rotated as @s rotated ~-90 0 on vehicle run function terf:entity/vehicle/multi_seat_test/movement/thrust
execute on passengers if predicate datapipes_lib:pressing_right rotated as @s rotated ~90 0 on vehicle run function terf:entity/vehicle/multi_seat_test/movement/thrust

execute store result storage terf:temp args.vx float 0.001 run scoreboard players get @s terf_data_X
execute store result storage terf:temp args.vy float 0.001 run scoreboard players get @s terf_data_Y
execute store result storage terf:temp args.vz float 0.001 run scoreboard players get @s terf_data_Z
function terf:entity/vehicle/multi_seat_test/movement/args with storage terf:temp args

#scoreboard players remove @s terf_data_Y 33

#slow the speed
scoreboard players operation @s terf_data_X *= 95 terf_states
scoreboard players operation @s terf_data_Y *= 95 terf_states
scoreboard players operation @s terf_data_Z *= 95 terf_states

scoreboard players operation @s terf_data_X /= 100 terf_states
scoreboard players operation @s terf_data_Y /= 100 terf_states
scoreboard players operation @s terf_data_Z /= 100 terf_states

#prevent being stuck on low speeds due to float inaccuracies
execute if score @s terf_data_X matches 1.. run scoreboard players remove @s terf_data_X 1
execute if score @s terf_data_Y matches 1.. run scoreboard players remove @s terf_data_Y 1
execute if score @s terf_data_Z matches 1.. run scoreboard players remove @s terf_data_Z 1
execute if score @s terf_data_X matches ..-1 run scoreboard players add @s terf_data_X 1
execute if score @s terf_data_Y matches ..-1 run scoreboard players add @s terf_data_Y 1
execute if score @s terf_data_Z matches ..-1 run scoreboard players add @s terf_data_Z 1

execute at @s if block ~ ~ ~ #minecraft:air run return fail
scoreboard players operation @s terf_data_X /= -1 terf_states
scoreboard players operation @s terf_data_Y /= -1 terf_states
scoreboard players operation @s terf_data_Z /= -1 terf_states
function terf:require/play_with_random_pitch {s:'terf:explosion.crash master @a[distance=0..] ~ ~ ~ 1',min:10000,max:20000}
execute on passengers run scoreboard players set @s terf_data_P 20
