setblock ~ ~ ~ minecraft:granite_slab[type=double]
execute positioned ~1 ~ ~ if block ~ ~ ~ minecraft:light[level=5] run function terf:entity/machines/mainframe/fill_checks_off
execute positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:light[level=5] run function terf:entity/machines/mainframe/fill_checks_off
execute positioned ~ ~1 ~ if block ~ ~ ~ minecraft:light[level=5] run function terf:entity/machines/mainframe/fill_checks_off
execute positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:light[level=5] run function terf:entity/machines/mainframe/fill_checks_off
execute positioned ~ ~ ~1 if block ~ ~ ~ minecraft:light[level=5] run function terf:entity/machines/mainframe/fill_checks_off
execute positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:light[level=5] run function terf:entity/machines/mainframe/fill_checks_off