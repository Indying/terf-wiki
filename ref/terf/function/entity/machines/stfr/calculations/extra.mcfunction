execute positioned ~ ~ ~8.5 as @a[distance=..3] at @s if block ~-.3 ~-0.01 ~ minecraft:barrier run tp @s ~.3 ~ ~
execute positioned ~ ~ ~-8.5 as @a[distance=..3] at @s if block ~.3 ~-0.01 ~ minecraft:barrier run tp @s ~-.3 ~ ~
execute positioned ~8.5 ~ ~ as @a[distance=..3] at @s if block ~ ~-0.01 ~.3 minecraft:barrier run tp @s ~ ~ ~-.3
execute positioned ~-8.5 ~ ~ as @a[distance=..3] at @s if block ~ ~-0.01 ~-.3 minecraft:barrier run tp @s ~ ~ ~.3

execute positioned ~ ~-0.3 ~ as @a[distance=..4] run damage @s 7 terf:reactor
fill ~2 ~2 ~2 ~-2 ~-2 ~-2 air destroy
