execute store result score height terf_states run data get storage terf:temp args.array[0].pos[1] 2

execute if score height terf_states = @s terf_data_C if score temp terf_states matches 1 run function datapipes_lib:require/interaction/turn_on_lever
execute if score height terf_states = @s terf_data_C if score temp terf_states matches 0 run function datapipes_lib:require/interaction/turn_off_lever
