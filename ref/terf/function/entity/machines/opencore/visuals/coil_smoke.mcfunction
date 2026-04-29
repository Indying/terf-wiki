execute as @s[tag=terf_bottomcoil] run particle minecraft:large_smoke ~-1.7 ~2.5 ~-1 0 0.2 0.2 0.04 1
execute as @s[tag=terf_bottomcoil] run particle minecraft:large_smoke ~2.7 ~2.5 ~-1 0 0.2 0.2 0.04 1
execute as @s[tag=terf_bottomcoil] run particle minecraft:large_smoke ~-1.7 ~2.5 ~2 0 0.2 0.2 0.04 1
execute as @s[tag=terf_bottomcoil] run particle minecraft:large_smoke ~2.7 ~2.5 ~2 0 0.2 0.2 0.04 1
execute as @s[tag=terf_bottomcoil] run particle minecraft:large_smoke ~-1 ~2.5 ~-1.7 0.2 0.2 0 0.04 1
execute as @s[tag=terf_bottomcoil] run particle minecraft:large_smoke ~2 ~2.5 ~-1.7 0.2 0.2 0 0.04 1
execute as @s[tag=terf_bottomcoil] run particle minecraft:large_smoke ~-1 ~2.5 ~2.7 0.2 0.2 0 0.04 1
execute as @s[tag=terf_bottomcoil] run particle minecraft:large_smoke ~2 ~2.5 ~2.7 0.2 0.2 0 0.04 1

$execute as @s[tag=terf_topcoil] positioned ~ ~5.5 ~ positioned ~ ~$(height) ~ run function terf:entity/machines/opencore/visuals/coil_smoke_top