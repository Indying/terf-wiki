$execute unless predicate {"condition":"minecraft:random_chance","chance":$(chance)} run return fail
function terf:require/play_with_random_pitch {s:"terf:dem.metal_2 master @a[distance=0..] ~.5 ~2 ~.5 5",min:15000,max:20000}

#have a chance to break the vents
execute positioned ~-1 ~ ~ run function terf:entity/machines/mcfr/break_vent with entity @s data.terf
execute positioned ~-1 ~ ~1 run function terf:entity/machines/mcfr/break_vent with entity @s data.terf
execute positioned ~2 ~ ~ run function terf:entity/machines/mcfr/break_vent with entity @s data.terf
execute positioned ~2 ~ ~1 run function terf:entity/machines/mcfr/break_vent with entity @s data.terf

execute positioned ~ ~ ~-1 run function terf:entity/machines/mcfr/break_vent with entity @s data.terf
execute positioned ~1 ~ ~-1 run function terf:entity/machines/mcfr/break_vent with entity @s data.terf
execute positioned ~ ~ ~2 run function terf:entity/machines/mcfr/break_vent with entity @s data.terf
execute positioned ~1 ~ ~2 run function terf:entity/machines/mcfr/break_vent with entity @s data.terf
