setblock ~ ~ ~ minecraft:light[level=5]
execute if block ~ ~1 ~ loom run scoreboard players add @s terf_data_A 1
execute if block ~ ~1 ~ loom if block ~ ~2 ~ loom run scoreboard players add @s terf_data_A 1
execute if block ~ ~1 ~ loom if block ~ ~2 ~ loom if block ~ ~3 ~ loom run scoreboard players add @s terf_data_A 1
execute positioned ~1 ~ ~ if block ~ ~ ~ minecraft:granite_slab[type=double] run function terf:entity/machines/mainframe/fill_checks_on
execute positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:granite_slab[type=double] run function terf:entity/machines/mainframe/fill_checks_on
execute positioned ~ ~1 ~ if block ~ ~ ~ minecraft:granite_slab[type=double] run function terf:entity/machines/mainframe/fill_checks_on
execute positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:granite_slab[type=double] run function terf:entity/machines/mainframe/fill_checks_on
execute positioned ~ ~ ~1 if block ~ ~ ~ minecraft:granite_slab[type=double] run function terf:entity/machines/mainframe/fill_checks_on
execute positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:granite_slab[type=double] run function terf:entity/machines/mainframe/fill_checks_on
