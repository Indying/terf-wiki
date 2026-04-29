setblock ~ ~ ~ lapis_block

execute if block ~1 ~ ~ red_glazed_terracotta[facing=east] positioned ~1 ~ ~ run function terf:entity/machines/solar_panel/connected_lapis_off
execute if block ~-1 ~ ~ red_glazed_terracotta[facing=east] positioned ~-1 ~ ~ run function terf:entity/machines/solar_panel/connected_lapis_off
execute if block ~ ~ ~1 red_glazed_terracotta[facing=east] positioned ~ ~ ~1 run function terf:entity/machines/solar_panel/connected_lapis_off
execute if block ~ ~ ~-1 red_glazed_terracotta[facing=east] positioned ~ ~ ~-1 run function terf:entity/machines/solar_panel/connected_lapis_off

scoreboard players remove @s terf_data_C 1