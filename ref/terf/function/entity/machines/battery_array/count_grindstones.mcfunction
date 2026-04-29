execute positioned ^ ^1 ^ if block ~ ~ ~ grindstone run function terf:entity/machines/battery_array/count_grindstones
execute positioned ~ ~ ~-1 if block ~ ~ ~ orange_glazed_terracotta[facing=north] rotated 180 0 run function terf:entity/machines/battery_array/count_batteries_north
execute positioned ~-1 ~ ~ if block ~ ~ ~ orange_glazed_terracotta[facing=west] rotated 90 0 run function terf:entity/machines/battery_array/count_batteries_west
execute positioned ~1 ~ ~ if block ~ ~ ~ orange_glazed_terracotta[facing=east] rotated 270 0 run function terf:entity/machines/battery_array/count_batteries_east
execute positioned ~ ~ ~1 if block ~ ~ ~ orange_glazed_terracotta[facing=south] rotated 0 0 run function terf:entity/machines/battery_array/count_batteries_south
