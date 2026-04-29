execute positioned ~ ~-1.6 ~ run scoreboard players operation @a[dx=0,dy=0,dz=0] terf_data_A += temp terf_states
scoreboard players operation temp terf_states *= 9 terf_states
scoreboard players operation temp terf_states /= 10 terf_states
execute if block ~.3 ~ ~ #minecraft:air if block ~ ~.3 ~ #minecraft:air if block ~ ~ ~.3 #minecraft:air if block ~-.3 ~ ~ #minecraft:air if block ~ ~-.3 ~ #minecraft:air if block ~ ~ ~-.3 #minecraft:air if score temp terf_states matches 1.. positioned ^ ^ ^.3 run function terf:entity/machines/stfr/radiation_raycast