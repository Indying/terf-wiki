data modify storage terf:temp temp set from entity @s Pos
execute store result score x terf_states run data get storage terf:temp temp[0] 1000
execute store result score y terf_states run data get storage terf:temp temp[1] 1000
execute store result score z terf_states run data get storage terf:temp temp[2] 1000

data modify storage terf:temp temp set from entity @s Motion
execute store result score motion_x terf_states run data get storage terf:temp temp[0] 50000
execute store result score motion_y terf_states run data get storage terf:temp temp[1] 50000
execute store result score motion_z terf_states run data get storage terf:temp temp[2] 50000

scoreboard players operation x terf_states -= attract_x terf_states
scoreboard players operation y terf_states -= attract_y terf_states
scoreboard players operation z terf_states -= attract_z terf_states

scoreboard players operation motion_x terf_states -= x terf_states
scoreboard players operation motion_y terf_states -= y terf_states
scoreboard players operation motion_z terf_states -= z terf_states

execute store result storage terf:temp temp[0] double 0.00002 run scoreboard players get motion_x terf_states
execute store result storage terf:temp temp[1] double 0.00002 run scoreboard players get motion_y terf_states
execute store result storage terf:temp temp[2] double 0.00002 run scoreboard players get motion_z terf_states
data modify entity @s Motion set from storage terf:temp temp
