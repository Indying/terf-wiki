setblock ~ ~ ~ red_glazed_terracotta
execute positioned ~1 ~ ~ if block ~ ~ ~ granite_slab[type=double] run function terf:entity/machines/battery_array/count_cables_on
execute positioned ~-1 ~ ~ if block ~ ~ ~ granite_slab[type=double] run function terf:entity/machines/battery_array/count_cables_on
execute positioned ~ ~ ~1 if block ~ ~ ~ granite_slab[type=double] run function terf:entity/machines/battery_array/count_cables_on
execute positioned ~ ~ ~-1 if block ~ ~ ~ granite_slab[type=double] run function terf:entity/machines/battery_array/count_cables_on

execute positioned ^ ^1 ^ if block ~ ~ ~ grindstone run function terf:entity/machines/battery_array/count_grindstones
