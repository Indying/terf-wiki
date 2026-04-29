execute store result score height terf_states run data get storage terf:temp args2.array[0].pos[1] 2
scoreboard players remove height terf_states 2
execute if score height terf_states > target_height terf_states run scoreboard players operation @s terf_data_A = height terf_states

data remove storage terf:temp args2.array[0]
execute if data storage terf:temp args2.array[0] run function terf:entity/machines/gear_elevator/button_checks/as_all_wood_buttons_topcheck