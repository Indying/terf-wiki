scoreboard players set @s terf_data_K 2
tag @s add terf_cant_breathe

#falling back onto planets
execute if entity @s[y=-1000,dy=1000] run function terf:entity/player/teleport_onto_planet

tag @s add terf_in_space
attribute @s minecraft:fall_damage_multiplier modifier add terf:no_space_fall_damage -1 add_multiplied_total

#cosmic radiation
execute positioned over motion_blocking if entity @s[dy=100000] run scoreboard players add @s terf_data_A 13

#meteors
execute if score @s terf_data_C matches 0 if predicate {"condition":"minecraft:random_chance","chance":0.002} run function terf:entity/meteor/spawn_space_random

#movement
attribute @s minecraft:gravity modifier remove terf:space_movement
execute if predicate datapipes_lib:pressing_jump unless predicate terf:has_zoom_slowness run return run attribute @s minecraft:gravity modifier add terf:space_movement -0.004 add_value
execute if predicate datapipes_lib:pressing_sneak run return run attribute @s minecraft:gravity modifier add terf:space_movement 0.004 add_value
