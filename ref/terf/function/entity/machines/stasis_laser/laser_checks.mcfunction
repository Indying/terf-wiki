#fail if laser structure is broken
scoreboard players set succeeded terf_states 0
execute if block ^ ^ ^1 minecraft:waxed_cut_copper if block ^1 ^ ^ minecraft:waxed_cut_copper if block ^1 ^ ^1 minecraft:waxed_cut_copper if block ^ ^-1 ^ minecraft:waxed_cut_copper if block ^ ^-1 ^1 minecraft:waxed_cut_copper if block ^1 ^-1 ^ minecraft:waxed_cut_copper if block ^1 ^-1 ^2 minecraft:waxed_cut_copper if block ^2 ^-1 ^1 minecraft:waxed_cut_copper if block ^2 ^-1 ^2 minecraft:waxed_cut_copper_slab if block ^1 ^-2 ^1 minecraft:waxed_cut_copper if block ^1 ^-2 ^2 minecraft:waxed_cut_copper_stairs if block ^2 ^-2 ^1 minecraft:waxed_cut_copper_stairs if block ^2 ^-2 ^2 minecraft:waxed_cut_copper if block ^2 ^-2 ^3 minecraft:waxed_cut_copper_stairs if block ^3 ^-2 ^2 minecraft:waxed_cut_copper_stairs if block ^3 ^-2 ^3 minecraft:waxed_cut_copper_stairs if block ^2 ^-3 ^2 minecraft:waxed_cut_copper_slab if block ^2 ^-3 ^3 minecraft:waxed_cut_copper_stairs if block ^3 ^-3 ^2 minecraft:waxed_cut_copper_stairs if block ^3 ^-3 ^3 minecraft:waxed_cut_copper if block ^4 ^-3 ^4 minecraft:waxed_lightning_rod if block ^3 ^-4 ^3 minecraft:waxed_cut_copper_slab if block ^3 ^-4 ^4 minecraft:waxed_lightning_rod if block ^4 ^-4 ^3 minecraft:waxed_lightning_rod if block ^4 ^-4 ^4 minecraft:waxed_cut_copper if block ^4 ^-5 ^4 minecraft:waxed_lightning_rod run scoreboard players set succeeded terf_states 1
execute if score succeeded terf_states matches 0 run return fail

scoreboard players set status terf_states 2
scoreboard players set terminated terf_states 100
function terf:entity/machines/stasis_laser/raycast

execute unless score status terf_states matches 5 run return fail
data modify storage terf:temp args set from entity @s data.terf
execute align xyz positioned ^3.5 ^-3.5 ^3.5 summon marker run function terf:entity/machines/stasis_laser/as_laser_marker with storage terf:temp args