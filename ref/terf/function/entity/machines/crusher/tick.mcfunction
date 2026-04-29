tag @s remove terf_crane
execute if score NETratetimer terf_states >= NETrate terf_states run tag @s remove terf_crusher_case
execute if score NETratetimer terf_states >= NETrate terf_states if block ^ ^2 ^ hopper if block ^1 ^2 ^ waxed_cut_copper_stairs if block ^-1 ^2 ^ waxed_cut_copper_stairs if block ^-1 ^1 ^ piston if block ^1 ^1 ^ piston if block ^-1 ^ ^ brown_glazed_terracotta if block ^1 ^ ^ granite_slab[type=double] run tag @s add terf_crusher_case
execute if entity @s[tag=!terf_crusher_case] run return fail

execute unless data entity @s data.terf.stored_recipe run return run execute if score NETratetimer terf_states >= NETrate terf_states run function terf:entity/machines/crusher/checks
execute if score @s datapipes_lib_power_storage matches 10.. run return run function terf:entity/machines/crusher/operation