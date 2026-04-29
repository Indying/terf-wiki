execute if block ~ ~ ~ #minecraft:air run return fail
scoreboard players add count terf_states 1
tp 0010cd2c-0010-cd2d-0010-c8e10010cd37 ~ ~ ~
data modify storage terf:temp temp set from entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 Pos
execute store result score x3 terf_states run data get storage terf:temp temp[0]
execute store result score y3 terf_states run data get storage terf:temp temp[1]
execute store result score z3 terf_states run data get storage terf:temp temp[2]

scoreboard players operation x2 terf_states += x3 terf_states
scoreboard players operation y2 terf_states += y3 terf_states
scoreboard players operation z2 terf_states += z3 terf_states
