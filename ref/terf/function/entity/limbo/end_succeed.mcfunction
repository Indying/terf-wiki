execute as @e[tag=terf_limbo,distance=..4] run kill @s

particle minecraft:totem_of_undying ~ ~ ~ .5 .5 .5 1 100 force
summon item ~ ~ ~ {Item:{count:1,id:"minecraft:diamond_block"}}
