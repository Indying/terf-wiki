scoreboard players add @s terf_data_A 1

execute if score @s terf_data_A matches ..20 run function terf:entity/explosion/large_explosion/effects

#sound
data modify storage terf:temp args set value {arg1:'execute as @a[distance=',arg3:'..',arg5:'] run function terf:entity/explosion/large_explosion/reach_player'}

scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players remove temp terf_states 1
scoreboard players operation temp terf_states *= 6 terf_states
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp terf_states
scoreboard players add temp terf_states 6
execute store result storage terf:temp args.arg4 int 1 run scoreboard players get temp terf_states

scoreboard players set temp2 terf_states 100
scoreboard players operation temp2 terf_states -= @s terf_data_A

function datapipes_lib:require/with_args/5 with storage terf:temp args


execute if score @s terf_data_A matches 100.. run kill @s
