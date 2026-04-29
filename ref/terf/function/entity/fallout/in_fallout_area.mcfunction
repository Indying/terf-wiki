execute store result score x2 terf_states run data get entity @s Pos[0] 100
execute store result score z2 terf_states run data get entity @s Pos[2] 100

scoreboard players operation x2 terf_states -= x terf_states
scoreboard players operation z2 terf_states -= z terf_states

execute store result storage terf:temp args.x float 0.01 run scoreboard players get x2 terf_states
data modify storage terf:temp args.y set value 0f
execute store result storage terf:temp args.z float 0.01 run scoreboard players get z2 terf_states
function datapipes_lib:require/calculate_distance with storage terf:temp args

execute store result score temp2 terf_states run data get storage datapipes_lib:temp output 100

scoreboard players operation temp terf_states = radius terf_states
scoreboard players operation temp terf_states -= temp2 terf_states
scoreboard players operation temp terf_states /= intensity_divider terf_states
execute if score temp terf_states matches ..0 run return fail

scoreboard players operation temp2 terf_states = temp terf_states
scoreboard players operation temp2 terf_states /= 2 terf_states
scoreboard players add temp2 terf_states 1
execute if score temp2 terf_states matches 101.. run scoreboard players set temp2 terf_states 100

data modify storage terf:temp args set value {arg1:'particle minecraft:falling_honey ~ ~40 ~ 30 2 30 0 ',arg3:' force @s'}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp2 terf_states
function datapipes_lib:require/with_args/3 with storage terf:temp args

execute positioned over motion_blocking unless entity @s[dy=500] run return fail

#title @s times 0 3 0
#title @s title [{"score":{"objective":"terf_states","name":"temp"}}]
scoreboard players operation @s terf_data_N += temp terf_states

execute unless block ~ ~ ~ water run return fail
scoreboard players operation temp terf_states *= 10 terf_states
scoreboard players operation @s terf_data_N += temp terf_states
execute positioned over motion_blocking run particle bubble_pop ~ ~-.1 ~ 0.2 0 0.2 0 1
