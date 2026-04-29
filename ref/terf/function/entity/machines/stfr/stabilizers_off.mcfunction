#funky stuff at stabilizer D because of quasi-connectivity
execute positioned ~ ~-6 ~ run function datapipes_lib:require/lightning_rod_off

execute positioned ~9 ~ ~ if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ minecraft:pink_glazed_terracotta
execute positioned ~-9 ~ ~ if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ minecraft:pink_glazed_terracotta
execute positioned ~ ~9 ~ if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ minecraft:pink_glazed_terracotta
execute positioned ~ ~-9 ~ if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ minecraft:pink_glazed_terracotta
execute positioned ~ ~ ~9 if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ minecraft:pink_glazed_terracotta
execute positioned ~ ~ ~-9 if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ minecraft:pink_glazed_terracotta
