rotate @s ~ ~
execute store result score rotation_x terf_states run data get entity @s Rotation[0] 1000
execute store result score rotation_y terf_states run data get entity @s Rotation[1] 1000
