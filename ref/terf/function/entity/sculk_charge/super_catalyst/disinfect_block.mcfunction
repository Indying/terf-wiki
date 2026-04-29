fillbiome ~4 ~-2 ~4 ~4 ~8 ~4 minecraft:plains replace terf:sculk_wasteland

execute unless block ~ ~ ~ minecraft:sculk run return fail
execute in terf:intermediary_technical_storage_dimension run forceload add ~ ~
clone from terf:intermediary_technical_storage_dimension ~ ~ ~ ~ ~ ~ ~ ~ ~ replace move
execute in terf:intermediary_technical_storage_dimension run forceload remove ~ ~

fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace minecraft:sculk_vein
execute positioned ~ ~1 ~ if block ~ ~ ~ sculk_shrieker run setblock ~ ~ ~ air
execute positioned ~ ~1 ~ if block ~ ~ ~ sculk_sensor run setblock ~ ~ ~ air
execute positioned ~ ~1 ~ if block ~ ~ ~ sculk_catalyst run setblock ~ ~ ~ air
execute positioned ~ ~1 ~ if block ~ ~ ~ minecraft:cyan_stained_glass run function terf:entity/sculk_charge/super_catalyst/break_crystal
execute positioned ~ ~1 ~ if block ~ ~ ~ minecraft:cyan_stained_glass_pane run function terf:entity/sculk_charge/super_catalyst/break_crystal
