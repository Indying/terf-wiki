scoreboard players add @s terf_data_B 1
scoreboard players add length terf_states 3

scoreboard players set succeeded terf_states 0
execute if block ^1 ^ ^ iron_block if block ^-1 ^ ^ iron_block if block ^ ^1 ^ iron_block if block ^ ^-1 ^ iron_block if block ^ ^ ^-1 smooth_stone if block ~ ~ ~ smooth_stone if block ^ ^ ^1 smooth_stone run scoreboard players set succeeded terf_states 1
execute if score succeeded terf_states matches 0 run return fail

#case
scoreboard players set succeeded terf_states 0
execute if block ^1 ^2 ^ #terf:turbine_medium_stairs if block ^-1 ^2 ^ #terf:turbine_medium_stairs if block ^1 ^2 ^1 #terf:turbine_medium_stairs if block ^-1 ^2 ^1 #terf:turbine_medium_stairs if block ^1 ^2 ^-1 #terf:turbine_medium_stairs if block ^-1 ^2 ^-1 #terf:turbine_medium_stairs if block ^2 ^1 ^ #terf:turbine_medium_stairs if block ^-2 ^1 ^ #terf:turbine_medium_stairs if block ^2 ^1 ^1 #terf:turbine_medium_stairs if block ^-2 ^1 ^1 #terf:turbine_medium_stairs if block ^2 ^1 ^-1 #terf:turbine_medium_stairs if block ^-2 ^1 ^-1 #terf:turbine_medium_stairs if block ^1 ^-2 ^ #terf:turbine_medium_stairs if block ^-1 ^-2 ^ #terf:turbine_medium_stairs if block ^1 ^-2 ^1 #terf:turbine_medium_stairs if block ^-1 ^-2 ^1 #terf:turbine_medium_stairs if block ^1 ^-2 ^-1 #terf:turbine_medium_stairs if block ^-1 ^-2 ^-1 #terf:turbine_medium_stairs if block ^2 ^-1 ^ #terf:turbine_medium_stairs if block ^-2 ^-1 ^ #terf:turbine_medium_stairs if block ^2 ^-1 ^1 #terf:turbine_medium_stairs if block ^-2 ^-1 ^1 #terf:turbine_medium_stairs if block ^2 ^-1 ^-1 #terf:turbine_medium_stairs if block ^-2 ^-1 ^-1 #terf:turbine_medium_stairs if block ^ ^1 ^1 #terf:turbine_medium_blocks if block ^1 ^1 ^1 #terf:turbine_medium_blocks if block ^-1 ^1 ^1 #terf:turbine_medium_blocks if block ^ ^2 ^1 #terf:turbine_medium_blocks if block ^ ^-1 ^1 #terf:turbine_medium_blocks if block ^1 ^-1 ^1 #terf:turbine_medium_blocks if block ^-1 ^-1 ^1 #terf:turbine_medium_blocks if block ^ ^-2 ^1 #terf:turbine_medium_blocks if block ^ ^1 ^-1 #terf:turbine_medium_blocks if block ^1 ^1 ^-1 #terf:turbine_medium_blocks if block ^-1 ^1 ^-1 #terf:turbine_medium_blocks if block ^ ^2 ^-1 #terf:turbine_medium_blocks if block ^ ^-1 ^-1 #terf:turbine_medium_blocks if block ^1 ^-1 ^-1 #terf:turbine_medium_blocks if block ^-1 ^-1 ^-1 #terf:turbine_medium_blocks if block ^ ^-2 ^-1 #terf:turbine_medium_blocks if block ^ ^-2 ^ #terf:turbine_medium_blocks if block ^1 ^ ^1 #terf:turbine_medium_blocks if block ^2 ^ ^1 #terf:turbine_medium_blocks if block ^1 ^ ^-1 #terf:turbine_medium_blocks if block ^2 ^ ^-1 #terf:turbine_medium_blocks if block ^2 ^ ^ #terf:turbine_medium_blocks if block ^-1 ^ ^1 #terf:turbine_medium_blocks if block ^-2 ^ ^1 #terf:turbine_medium_blocks if block ^-2 ^ ^-1 #terf:turbine_medium_blocks if block ^-2 ^ ^ #terf:turbine_medium_blocks if block ^-1 ^ ^-1 #terf:turbine_medium_blocks if block ^ ^2 ^ #terf:turbine_medium_blocks run scoreboard players set succeeded terf_states 1
execute if score succeeded terf_states matches 0 run return fail

execute if block ^2 ^ ^ chiseled_quartz_block run data modify storage terf:temp args merge value {sx:2,sy:1}
execute if block ^-2 ^ ^ chiseled_quartz_block run data modify storage terf:temp args merge value {sx:-2,sy:1}
execute if block ^ ^2 ^ chiseled_quartz_block run data modify storage terf:temp args merge value {sx:'',sy:3}
execute if block ^ ^-2 ^ chiseled_quartz_block run data modify storage terf:temp args merge value {sx:'',sy:-1}

execute if block ^1 ^ ^-1 smooth_basalt run data modify storage terf:temp args merge value {wx:1,wy:1}
execute if block ^-1 ^ ^-1 smooth_basalt run data modify storage terf:temp args merge value {wx:-1,wy:1}
execute if block ^ ^1 ^-1 smooth_basalt run data modify storage terf:temp args merge value {wx:'',wy:2}
execute if block ^ ^-1 ^-1 smooth_basalt run data modify storage terf:temp args merge value {wx:'',wy:''}

execute store result storage terf:temp args.wlength int 1 run scoreboard players get length terf_states
scoreboard players add length terf_states 1
execute store result storage terf:temp args.slength int 1 run scoreboard players get length terf_states
function terf:entity/machines/turbine_medium/check_drums_args with storage terf:temp args

execute positioned ^ ^ ^4 run function terf:entity/machines/turbine_medium/check_drums
