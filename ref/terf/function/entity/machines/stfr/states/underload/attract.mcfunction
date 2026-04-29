$data modify storage terf:temp pos set value {x:$(x),y:$(y),z:$(z)}
execute store result score attract_x terf_states run data get storage terf:temp pos.x 1000
execute store result score attract_y terf_states run data get storage terf:temp pos.y 1000
execute store result score attract_z terf_states run data get storage terf:temp pos.z 1000

execute store result score motion_x terf_states run data get entity @s Motion[0] 100000
execute store result score motion_y terf_states run data get entity @s Motion[1] 100000
execute store result score motion_z terf_states run data get entity @s Motion[2] 100000
execute store result score x terf_states run data get entity @s Pos[0] 1000
execute store result score y terf_states run data get entity @s Pos[1] 1000
execute store result score z terf_states run data get entity @s Pos[2] 1000


scoreboard players operation x terf_states -= attract_x terf_states
scoreboard players operation y terf_states -= attract_y terf_states
scoreboard players operation z terf_states -= attract_z terf_states

scoreboard players operation motion_x terf_states -= x terf_states
scoreboard players operation motion_y terf_states -= y terf_states
scoreboard players operation motion_z terf_states -= z terf_states


execute store result entity @s Motion[0] double 0.00001 run scoreboard players get motion_x terf_states
execute store result entity @s Motion[1] double 0.00001 run scoreboard players get motion_y terf_states
execute store result entity @s Motion[2] double 0.00001 run scoreboard players get motion_z terf_states

data modify entity @s Time set value 5