rotate @s facing entity @n[tag=terf_art_target] eyes
execute store result score rot_x terf_states run data get entity @s Rotation[0] 1000
execute store result score rot_y terf_states run data get entity @s Rotation[1] 1000