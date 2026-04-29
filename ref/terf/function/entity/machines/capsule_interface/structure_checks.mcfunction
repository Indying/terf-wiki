execute positioned ^ ^3 ^-1 unless block ~ ~ ~ sticky_piston[facing=down] unless block ~ ~ ~ moving_piston run return fail
execute positioned ^ ^-1 ^-1 unless block ~ ~ ~ sticky_piston[facing=up] unless block ~ ~ ~ moving_piston run return fail

execute \
if block ^ ^1 ^-2 waxed_cut_copper \
if block ^1 ^1 ^-1 smooth_basalt \
if block ^-1 ^1 ^-1 chiseled_quartz_block \
positioned ^ ^ ^-1 \
if block ~ ~ ~1 #minecraft:stairs[facing=north] \
if block ~ ~ ~-1 #minecraft:stairs[facing=south] \
if block ~1 ~ ~ #minecraft:stairs[facing=west] \
if block ~-1 ~ ~ #minecraft:stairs[facing=east] \
if block ~ ~2 ~1 #minecraft:stairs[facing=north] \
if block ~ ~2 ~-1 #minecraft:stairs[facing=south] \
if block ~1 ~2 ~ #minecraft:stairs[facing=west] \
if block ~-1 ~2 ~ #minecraft:stairs[facing=east] \
run return 1