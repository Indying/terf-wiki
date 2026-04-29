stopsound @s * terf:explosion.explosion_rumble
execute if score temp2 terf_states matches 61.. run scoreboard players add @s terf_data_P 80

data modify storage terf:temp args.arg1 set value "playsound terf:explosion.pressuregigaboom master @s ~ ~ ~ 75 "
execute if score temp2 terf_states matches ..60 run data modify storage terf:temp args.arg1 set value "playsound terf:explosion.tank_shot master @s ~ ~ ~ 75 "
execute if score temp2 terf_states matches ..30 run data modify storage terf:temp args.arg1 set value "playsound terf:explosion.explosion_far master @s ~ ~ ~ 75 "

execute store result storage terf:temp args.arg2 float 0.02 run scoreboard players get temp2 terf_states

function datapipes_lib:require/with_args/2 with storage terf:temp args