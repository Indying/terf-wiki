tag @s remove terf_stab1
tag @s remove terf_stab2
tag @s remove terf_stab3
tag @s remove terf_stab4
tag @s remove terf_stab5
tag @s remove terf_stab6

tag @s remove terf_stab1_core
tag @s remove terf_stab2_core
tag @s remove terf_stab3_core
tag @s remove terf_stab4_core
tag @s remove terf_stab5_core
tag @s remove terf_stab6_core

tag @s remove terf_stab_pistons

tag @s remove terf_case

execute rotated 180 -90 unless block ^ ^ ^4 air unless block ^ ^ ^5 air unless block ^ ^ ^6 air unless block ^ ^ ^7 air unless block ^ ^ ^8 air unless block ^ ^ ^9 air unless block ^ ^ ^10 air unless block ^ ^ ^11 air unless block ^ ^ ^12 air unless block ^ ^ ^13 air run tag @s add terf_stab1_core
execute rotated 180 90 unless block ^ ^ ^4 air unless block ^ ^ ^5 air unless block ^ ^ ^6 air unless block ^ ^ ^7 air unless block ^ ^ ^8 air unless block ^ ^ ^9 air unless block ^ ^ ^10 air unless block ^ ^ ^11 air unless block ^ ^ ^12 air unless block ^ ^ ^13 air run tag @s add terf_stab6_core

execute rotated 0 0 unless block ^ ^ ^4 air unless block ^ ^ ^5 air unless block ^ ^ ^6 air unless block ^ ^ ^7 air unless block ^ ^ ^8 air unless block ^ ^ ^9 air unless block ^ ^ ^10 air unless block ^ ^ ^11 air unless block ^ ^ ^12 air unless block ^ ^ ^13 air run tag @s add terf_stab2_core
execute rotated 180 0 unless block ^ ^ ^4 air unless block ^ ^ ^5 air unless block ^ ^ ^6 air unless block ^ ^ ^7 air unless block ^ ^ ^8 air unless block ^ ^ ^9 air unless block ^ ^ ^10 air unless block ^ ^ ^11 air unless block ^ ^ ^12 air unless block ^ ^ ^13 air run tag @s add terf_stab4_core

execute rotated -90 0 unless block ^ ^ ^4 air unless block ^ ^ ^5 air unless block ^ ^ ^6 air unless block ^ ^ ^7 air unless block ^ ^ ^8 air unless block ^ ^ ^9 air unless block ^ ^ ^10 air unless block ^ ^ ^11 air unless block ^ ^ ^12 air unless block ^ ^ ^13 air run tag @s add terf_stab3_core
execute rotated 90 0 unless block ^ ^ ^4 air unless block ^ ^ ^5 air unless block ^ ^ ^6 air unless block ^ ^ ^7 air unless block ^ ^ ^8 air unless block ^ ^ ^9 air unless block ^ ^ ^10 air unless block ^ ^ ^11 air unless block ^ ^ ^12 air unless block ^ ^ ^13 air run tag @s add terf_stab5_core

execute rotated 0 -90 if block ^1 ^ ^5 andesite_stairs if block ^-1 ^ ^5 andesite_stairs run function terf:entity/machines/stfr/check_stabilizer {south:"up",east:"east",north:"down",west:"west",up:"north",down:"south",tag:"terf_stab1"}
execute rotated 0 90 if block ^1 ^ ^5 andesite_stairs if block ^-1 ^ ^5 andesite_stairs run function terf:entity/machines/stfr/check_stabilizer {south:"down",east:"east",north:"up",west:"west",up:"south",down:"north",tag:"terf_stab6"}

execute rotated 0 0 if block ^1 ^ ^5 petrified_oak_slab[type=double] if block ^-1 ^ ^5 petrified_oak_slab[type=double] run function terf:entity/machines/stfr/check_stabilizer {south:"south",east:"east",north:"north",west:"west",up:"up",down:"down",tag:"terf_stab2"}
execute rotated 180 0 if block ^1 ^ ^5 petrified_oak_slab[type=double] if block ^-1 ^ ^5 petrified_oak_slab[type=double] run function terf:entity/machines/stfr/check_stabilizer {south:"north",east:"west",north:"south",west:"east",up:"up",down:"down",tag:"terf_stab4"}

execute rotated 90 0 if block ^1 ^ ^5 petrified_oak_slab[type=double] if block ^-1 ^ ^5 petrified_oak_slab[type=double] run function terf:entity/machines/stfr/check_stabilizer {south:"west",east:"south",north:"east",west:"north",up:"up",down:"down",tag:"terf_stab5"}
execute rotated -90 0 if block ^1 ^ ^5 petrified_oak_slab[type=double] if block ^-1 ^ ^5 petrified_oak_slab[type=double] run function terf:entity/machines/stfr/check_stabilizer {south:"east",east:"north",north:"west",west:"south",up:"up",down:"down",tag:"terf_stab3"}

execute if block ~ ~7 ~ piston_head[facing=down,type=sticky] if block ~ ~-7 ~ piston_head[facing=up,type=sticky] if block ~ ~ ~7 piston_head[facing=north,type=sticky] if block ~ ~ ~-7 piston_head[facing=south,type=sticky] if block ~7 ~ ~ piston_head[facing=west,type=sticky] if block ~-7 ~ ~ piston_head[facing=east,type=sticky] if block ~9 ~ ~ redstone_block if block ~-9 ~ ~ redstone_block if block ~ ~9 ~ redstone_block if block ~ ~-9 ~ redstone_block if block ~ ~ ~9 redstone_block if block ~ ~ ~-9 redstone_block run tag @s add terf_stab_pistons

function terf:entity/machines/stfr/check_case

#convert stabilizers rotating parts
execute if score @s terf_data_A matches 16 run return fail

execute as @s[tag=terf_stab1] unless block ~ ~10 ~ minecraft:barrier run function terf:entity/machines/stfr/stab_transform/on/stab_u with entity @s data.terf
execute as @s[tag=terf_stab2] unless block ~ ~ ~10 minecraft:barrier run function terf:entity/machines/stfr/stab_transform/on/stab_s with entity @s data.terf
execute as @s[tag=terf_stab3] unless block ~10 ~ ~ minecraft:barrier run function terf:entity/machines/stfr/stab_transform/on/stab_e with entity @s data.terf
execute as @s[tag=terf_stab4] unless block ~ ~ ~-10 minecraft:barrier run function terf:entity/machines/stfr/stab_transform/on/stab_n with entity @s data.terf
execute as @s[tag=terf_stab5] unless block ~-10 ~ ~ minecraft:barrier run function terf:entity/machines/stfr/stab_transform/on/stab_w with entity @s data.terf
execute as @s[tag=terf_stab6] unless block ~ ~-10 ~ minecraft:barrier run function terf:entity/machines/stfr/stab_transform/on/stab_d with entity @s data.terf

execute as @s[tag=!terf_stab1] if block ~ ~10 ~ minecraft:barrier run function terf:entity/machines/stfr/stab_transform/off/stab_u with entity @s data.terf
execute as @s[tag=!terf_stab2] if block ~ ~ ~10 minecraft:barrier run function terf:entity/machines/stfr/stab_transform/off/stab_s with entity @s data.terf
execute as @s[tag=!terf_stab3] if block ~10 ~ ~ minecraft:barrier run function terf:entity/machines/stfr/stab_transform/off/stab_e with entity @s data.terf
execute as @s[tag=!terf_stab4] if block ~ ~ ~-10 minecraft:barrier run function terf:entity/machines/stfr/stab_transform/off/stab_n with entity @s data.terf
execute as @s[tag=!terf_stab5] if block ~-10 ~ ~ minecraft:barrier run function terf:entity/machines/stfr/stab_transform/off/stab_w with entity @s data.terf
execute as @s[tag=!terf_stab6] if block ~ ~-10 ~ minecraft:barrier run function terf:entity/machines/stfr/stab_transform/off/stab_d with entity @s data.terf
