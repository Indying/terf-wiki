execute if score @s terf_data_P < temp2 terf_states run scoreboard players operation @s terf_data_P = temp2 terf_states

scoreboard players add temp2 terf_states 20
data modify storage terf:temp args.arg1 set value "playsound terf:explosion.missile master @s ~ ~ ~ 16 "
execute store result storage terf:temp args.arg2 float 0.03 run scoreboard players get temp2 terf_states
function datapipes_lib:require/with_args/2 with storage terf:temp args
