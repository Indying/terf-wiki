#get current pitch and yaw
rotate 0010eff0-0010-effa-0010-cd370010c94e ~ ~
execute store result score #yaw2 terf_states run data get entity 0010eff0-0010-effa-0010-cd370010c94e Rotation[0] 1000
execute store result score #pitch2 terf_states run data get entity 0010eff0-0010-effa-0010-cd370010c94e Rotation[1] 1000

#get players pitch and yaw
execute store result score #yaw terf_states run data get entity @s Rotation[0] 1000
execute store result score #pitch terf_states run data get entity @s Rotation[1] 1000

#transform around x axis
execute store result entity 0010eff0-0010-effa-0010-cd370010c94e Rotation[0] float -0.001 run scoreboard players operation #yaw terf_states -= #yaw2 terf_states
execute as 0010eff0-0010-effa-0010-cd370010c94e at @s positioned 0.0 0.0 0.0 rotated ~ 0 run tp @s ^ ^ ^1
execute store result score #x terf_states run data get entity 0010eff0-0010-effa-0010-cd370010c94e Pos[0] 1000
execute store result score #z terf_states store result score #y terf_states run data get entity 0010eff0-0010-effa-0010-cd370010c94e Pos[2] 1000

#transform around y axis
execute store result entity 0010eff0-0010-effa-0010-cd370010c94e Rotation[0] float -0.001 run scoreboard players get #pitch terf_states
execute as 0010eff0-0010-effa-0010-cd370010c94e at @s positioned 0.0 0.0 0.0 rotated ~ 0 run tp @s ^ ^ ^1
execute store result score #pitchsin terf_states run data get entity 0010eff0-0010-effa-0010-cd370010c94e Pos[0] 1000
execute store result score #pitchcos terf_states run data get entity 0010eff0-0010-effa-0010-cd370010c94e Pos[2] 1000
scoreboard players operation #y terf_states *= #pitchsin terf_states
scoreboard players operation #z terf_states *= #pitchcos terf_states
scoreboard players operation #y terf_states /= 1000 terf_states
scoreboard players operation #z terf_states /= 1000 terf_states

scoreboard players operation #x terf_states *= 2 terf_states
scoreboard players operation #y terf_states *= 2 terf_states
scoreboard players operation #z terf_states *= 2 terf_states

function terf:require/launch_player/launch

