$execute unless entity @s[gamemode=creative] run item modify entity @s weapon.$(hand) {"function":"minecraft:set_damage","damage":-0.00051,"add":true}

function terf:require/play_with_random_pitch {s:'entity.wither.shoot master @a[distance=0..] ~ ~ ~ 1',min:5000,max:6000}

data modify storage terf:temp args set value {command:'function terf:entity/player/tool/fire_extinguisher/start_raycast'}
execute store result storage terf:temp args.yaw float 0.01 run random value -1000..1000
execute store result storage terf:temp args.pitch float 0.01 run random value -1000..1000
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

execute store result storage terf:temp args.yaw float 0.01 run random value -1000..1000
execute store result storage terf:temp args.pitch float 0.01 run random value -1000..1000
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

execute store result storage terf:temp args.yaw float 0.01 run random value -1000..1000
execute store result storage terf:temp args.pitch float 0.01 run random value -1000..1000
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

execute store result storage terf:temp args.yaw float 0.01 run random value -1000..1000
execute store result storage terf:temp args.pitch float 0.01 run random value -1000..1000
function datapipes_lib:require/run_rotated_relative with storage terf:temp args

#if in space
execute if function terf:require/is_dimension_not_space run return fail

scoreboard players set #x terf_states 0
scoreboard players set #y terf_states 0
scoreboard players set #z terf_states -500
function terf:require/launch_player/launch