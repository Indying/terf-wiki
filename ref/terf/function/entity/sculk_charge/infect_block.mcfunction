execute in terf:intermediary_technical_storage_dimension run forceload add ~ ~
clone ~ ~ ~ ~ ~ ~ to terf:intermediary_technical_storage_dimension ~ ~ ~ replace move
execute in terf:intermediary_technical_storage_dimension run forceload remove ~ ~

function terf:entity/sculk_charge/infect_block_args with entity @s data.terf

setblock ~ ~ ~ sculk
execute positioned ~1 ~ ~ if block ~ ~ ~ minecraft:sculk_vein run setblock ~ ~ ~ air
execute positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:sculk_vein run setblock ~ ~ ~ air
execute positioned ~ ~1 ~ if block ~ ~ ~ minecraft:sculk_vein run setblock ~ ~ ~ air
execute positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:sculk_vein run setblock ~ ~ ~ air
execute positioned ~ ~ ~1 if block ~ ~ ~ minecraft:sculk_vein run setblock ~ ~ ~ air
execute positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:sculk_vein run setblock ~ ~ ~ air
execute positioned ~1 ~1 ~ if block ~ ~ ~ air run function terf:entity/sculk_charge/setblock_sculk_vein
execute positioned ~-1 ~1 ~ if block ~ ~ ~ air run function terf:entity/sculk_charge/setblock_sculk_vein
execute positioned ~ ~1 ~1 if block ~ ~ ~ air run function terf:entity/sculk_charge/setblock_sculk_vein
execute positioned ~ ~1 ~-1 if block ~ ~ ~ air run function terf:entity/sculk_charge/setblock_sculk_vein
execute positioned ~1 ~-1 ~ if block ~ ~ ~ air run function terf:entity/sculk_charge/setblock_sculk_vein
execute positioned ~-1 ~-1 ~ if block ~ ~ ~ air run function terf:entity/sculk_charge/setblock_sculk_vein
execute positioned ~ ~-1 ~1 if block ~ ~ ~ air run function terf:entity/sculk_charge/setblock_sculk_vein
execute positioned ~ ~-1 ~-1 if block ~ ~ ~ air run function terf:entity/sculk_charge/setblock_sculk_vein
execute positioned ~1 ~ ~1 if block ~ ~ ~ air run function terf:entity/sculk_charge/setblock_sculk_vein
execute positioned ~-1 ~ ~1 if block ~ ~ ~ air run function terf:entity/sculk_charge/setblock_sculk_vein
execute positioned ~1 ~ ~-1 if block ~ ~ ~ air run function terf:entity/sculk_charge/setblock_sculk_vein
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ air run function terf:entity/sculk_charge/setblock_sculk_vein

execute if predicate datapipes_lib:chances/3 if block ~ ~1 ~ air run setblock ~ ~1 ~ minecraft:sculk_sensor
execute if predicate datapipes_lib:chances/0.3 if block ~ ~1 ~ air run setblock ~ ~1 ~ minecraft:sculk_shrieker[can_summon=true]
execute if predicate datapipes_lib:chances/0.3 if block ~ ~1 ~ air run setblock ~ ~1 ~ minecraft:cyan_stained_glass_pane
execute if predicate datapipes_lib:chances/0.1 positioned ~ ~1 ~ if block ~ ~ ~ air unless entity @e[type=minecraft:marker,tag=terf_super_catalyst,distance=..30] run function terf:entity/sculk_charge/super_catalyst/setblock

fillbiome ~4 ~-2 ~4 ~4 ~8 ~4 terf:sculk_wasteland

scoreboard players set @s terf_data_A 0
playsound minecraft:block.sculk_catalyst.hit block @a[distance=0..] ~ ~ ~ 1 0