setblock ~ ~ ~ granite_slab[type=double]
execute positioned ~1 ~ ~ if block ~ ~ ~ red_glazed_terracotta run function terf:entity/machines/battery_array/count_cables_off
execute positioned ~-1 ~ ~ if block ~ ~ ~ red_glazed_terracotta run function terf:entity/machines/battery_array/count_cables_off
execute positioned ~ ~ ~1 if block ~ ~ ~ red_glazed_terracotta run function terf:entity/machines/battery_array/count_cables_off
execute positioned ~ ~ ~-1 if block ~ ~ ~ red_glazed_terracotta run function terf:entity/machines/battery_array/count_cables_off
