stopsound @s * terf:explosion.explosion_rumble
data modify storage terf:temp args.arg1 set value "playsound terf:explosion.reactorexplosion master @s ~ ~ ~ 150 "
execute store result storage terf:temp args.arg2 float 0.002 run scoreboard players get temp2 terf_states
function terf:require/ceiling_dust/start

function datapipes_lib:require/with_args/2 with storage terf:temp args

scoreboard players operation @s terf_data_P += temp2 terf_states
scoreboard players operation @s terf_data_P /= 20 terf_states