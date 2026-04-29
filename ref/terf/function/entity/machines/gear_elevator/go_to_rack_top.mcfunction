execute if block ~ ~1 ~ #minecraft:stairs run scoreboard players add @s terf_data_C 2
execute positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:stairs run function terf:entity/machines/gear_elevator/go_to_rack_top
execute unless block ~ ~1 ~ #minecraft:stairs run function terf:entity/machines/gear_elevator/rack_top_checks