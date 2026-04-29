scoreboard players set x terf_states 0
scoreboard players set y terf_states 1000
scoreboard players set z terf_states 0

##Get players pitch and yaw
execute store result score #yaw terf_states run data get entity @s Rotation[0] 1000
execute store result score #pitch terf_states run data get entity @s Rotation[1] 1000

##Transform around y axis
execute store result entity 0010eff0-0010-effa-0010-cd370010c94e Rotation[0] float 0.001 run scoreboard players get #yaw terf_states
execute as 0010eff0-0010-effa-0010-cd370010c94e at @s positioned 0.0 0.0 0.0 rotated ~ 0 run tp @s ^ ^ ^1
execute store result score #cos terf_states run data get entity 0010eff0-0010-effa-0010-cd370010c94e Rotation[0] 1000
execute store result score #sin terf_states run data get entity 0010eff0-0010-effa-0010-cd370010c94e Rotation[2] 1000
#x1 = x * cos + z * sin
#y1 = y
#z1 = -x * sin + z * cos

scoreboard players operation x1 terf_states = x terf_states
scoreboard players operation x1 terf_states *= #cos terf_states
scoreboard players operation x1 terf_states /= 1000 terf_states
scoreboard players operation temp terf_states = z terf_states
scoreboard players operation temp terf_states *= #sin terf_states
scoreboard players operation temp terf_states /= 1000 terf_states
scoreboard players operation x1 terf_states += temp terf_states

scoreboard players operation y1 terf_states = y terf_states

scoreboard players operation z1 terf_states = x terf_states
scoreboard players operation z1 terf_states *= -1 terf_states
scoreboard players operation z1 terf_states *= #sin terf_states
scoreboard players operation z1 terf_states /= 1000 terf_states
scoreboard players operation temp terf_states = z terf_states
scoreboard players operation temp terf_states *= #cos terf_states
scoreboard players operation temp terf_states /= 1000 terf_states
scoreboard players operation x1 terf_states += temp terf_states

##Transform around x axis
execute store result entity 0010eff0-0010-effa-0010-cd370010c94e Rotation[0] float 0.001 run scoreboard players get #pitch terf_states
execute as 0010eff0-0010-effa-0010-cd370010c94e at @s positioned 0.0 0.0 0.0 rotated ~ 0 run tp @s ^ ^ ^1
execute store result score #cos terf_states run data get entity 0010eff0-0010-effa-0010-cd370010c94e Rotation[0] 1000
execute store result score #sin terf_states run data get entity 0010eff0-0010-effa-0010-cd370010c94e Rotation[2] 1000
#x2 = x1
#y2 = y1 * cos - z1 * sin
#z2 = y1 * sin + z1 * cos

scoreboard players operation x2 terf_states = x1 terf_states

scoreboard players operation y2 terf_states = y1 terf_states
scoreboard players operation y2 terf_states *= #cos terf_states
scoreboard players operation y2 terf_states /= 1000 terf_states
scoreboard players operation temp terf_states = z1 terf_states
scoreboard players operation temp terf_states *= #sin terf_states
scoreboard players operation temp terf_states /= 1000 terf_states
scoreboard players operation y2 terf_states -= temp terf_states

scoreboard players operation z2 terf_states = y1 terf_states
scoreboard players operation z2 terf_states *= #sin terf_states
scoreboard players operation z2 terf_states /= 1000 terf_states
scoreboard players operation temp terf_states = z1 terf_states
scoreboard players operation temp terf_states *= #cos terf_states
scoreboard players operation temp terf_states /= 1000 terf_states
scoreboard players operation z2 terf_states += temp terf_states

##Launch player
scoreboard players operation #x terf_states = x2 terf_states
scoreboard players operation #y terf_states = y2 terf_states
scoreboard players operation #z terf_states = z2 terf_states

scoreboard players operation x test = #x terf_states
scoreboard players operation y test = #y terf_states
scoreboard players operation z test = #z terf_states

function terf:require/launch_player/launch

