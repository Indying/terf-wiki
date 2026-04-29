function terf:entity/vehicle/art/beam/hit_entity_effects
scoreboard players add @s terf_data_B 10
execute if score @s terf_data_B matches 100.. on vehicle run function terf:entity/vehicle/art/destroy
