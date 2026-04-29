$playsound block.sand.break master @a[distance=0..] ~ ~ ~ $(volume) 0.7
$execute unless predicate {"condition":"minecraft:random_chance","chance":$(chance)} run return fail

execute unless predicate datapipes_lib:chances/5 run return fail

#have a chance to break the vents
execute positioned ~-1 ~ ~ run function terf:entity/machines/mcfr/break_vent with entity @s data.terf
execute positioned ~-1 ~ ~1 run function terf:entity/machines/mcfr/break_vent with entity @s data.terf
execute positioned ~2 ~ ~ run function terf:entity/machines/mcfr/break_vent with entity @s data.terf
execute positioned ~2 ~ ~1 run function terf:entity/machines/mcfr/break_vent with entity @s data.terf

execute positioned ~ ~ ~-1 run function terf:entity/machines/mcfr/break_vent with entity @s data.terf
execute positioned ~1 ~ ~-1 run function terf:entity/machines/mcfr/break_vent with entity @s data.terf
execute positioned ~ ~ ~2 run function terf:entity/machines/mcfr/break_vent with entity @s data.terf
execute positioned ~1 ~ ~2 run function terf:entity/machines/mcfr/break_vent with entity @s data.terf
