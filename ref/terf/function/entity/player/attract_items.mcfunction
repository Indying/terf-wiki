data modify storage terf:temp temp set from entity @s Pos
execute store result score attract_x terf_states run data get storage terf:temp temp[0] 1000
execute store result score attract_y terf_states run data get storage terf:temp temp[1] 1000
execute store result score attract_z terf_states run data get storage terf:temp temp[2] 1000
execute as @e[type=item,distance=..7] run function terf:entity/player/attract_items_as