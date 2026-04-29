execute if score terminated terf_states matches 256.. run return fail
scoreboard players add terminated terf_states 1
particle minecraft:large_smoke ~ ~1 ~ 0.2 0 0.2 0 1 force
playsound minecraft:entity.item.break master @a[distance=0..] ~ ~ ~ 1 0
execute if block ~ ~ ~ minecraft:magenta_glazed_terracotta[facing=north] rotated 0 0 positioned ^ ^ ^1 run return run function terf:entity/machines/conveyor/explode
execute if block ~ ~ ~ minecraft:magenta_glazed_terracotta[facing=east] rotated 90 0 positioned ^ ^ ^1 run return run function terf:entity/machines/conveyor/explode
execute if block ~ ~ ~ minecraft:magenta_glazed_terracotta[facing=south] rotated 180 0 positioned ^ ^ ^1 run return run function terf:entity/machines/conveyor/explode
execute if block ~ ~ ~ minecraft:magenta_glazed_terracotta[facing=west] rotated -90 0 positioned ^ ^ ^1 run function terf:entity/machines/conveyor/explode