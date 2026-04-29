particle poof ~ ~ ~ 0.2 0.2 0.2 1 1 force
fill ~1 ~ ~ ~-1 ~ ~ air replace void_air
fill ~ ~1 ~ ~ ~-1 ~ air replace void_air
fill ~ ~ ~1 ~ ~ ~-1 air replace void_air
execute positioned ~-1 ~-1 ~-1 as @a[dx=2,dy=2,dz=2] run damage @s 5 terf:depressurization
