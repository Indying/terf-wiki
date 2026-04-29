#terf_data_A = time
#terf_data_B = countdown

execute unless data entity @s Passengers run function terf:entity/nuke/summon_interaction
execute unless score @s terf_data_A = @s terf_data_A run scoreboard players set @s terf_data_A 4800

tag @s remove terf_nuke_active
execute positioned ~1 ~ ~ if predicate terf:is_block_active run tag @s add terf_nuke_active
execute positioned ~-1 ~ ~ if predicate terf:is_block_active run tag @s add terf_nuke_active
execute positioned ~ ~1 ~ if predicate terf:is_block_active run tag @s add terf_nuke_active
execute positioned ~ ~-1 ~ if predicate terf:is_block_active run tag @s add terf_nuke_active
execute positioned ~ ~ ~1 if predicate terf:is_block_active run tag @s add terf_nuke_active
execute positioned ~ ~ ~-1 if predicate terf:is_block_active run tag @s add terf_nuke_active

scoreboard players reset @s[tag=!terf_nuke_active] terf_data_B
execute as @s[tag=terf_nuke_active] run function terf:entity/nuke/operation

execute on passengers run function terf:entity/nuke/as_interaction