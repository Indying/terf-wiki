data modify storage terf:temp temp set from entity @s Rotation
effect give @s minecraft:resistance 1 3 true
scoreboard players set succeeded terf_states 1
execute if predicate datapipes_lib:pressing_jump on vehicle on passengers if entity @s[type=interaction] on passengers on passengers on passengers run function terf:entity/vehicle/mrt/as_gun_shoot