setblock ~ ~ ~ red_glazed_terracotta[facing=east]

execute if block ~1 ~ ~ lapis_block positioned ~1 ~ ~ run function terf:entity/machines/solar_panel/connected_lapis_on
execute if block ~-1 ~ ~ lapis_block positioned ~-1 ~ ~ run function terf:entity/machines/solar_panel/connected_lapis_on
execute if block ~ ~ ~1 lapis_block positioned ~ ~ ~1 run function terf:entity/machines/solar_panel/connected_lapis_on
execute if block ~ ~ ~-1 lapis_block positioned ~ ~ ~-1 run function terf:entity/machines/solar_panel/connected_lapis_on

scoreboard players add @s terf_data_C 1

execute positioned ~ ~1 ~ if predicate datapipes_lib:can_see_sky run return run scoreboard players add power terf_states 1
scoreboard players add blocked terf_states 1
