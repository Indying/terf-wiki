#terf_data_A = reflections

function terf:entity/neutron/move with entity @s data.terf
execute if entity @s[nbt={data:{terf:{nSpeed:0.0f}}}] run return run kill @s

$execute $(reactivity) at @s align xyz positioned ~.5 ~.5 ~.5 as @n[type=minecraft:marker,tag=terf_fuel_rod,distance=..0.01] run function terf:entity/machines/fission_reactor/fuel_rod_split
execute if block ~ ~ ~ coal_block run return run data modify entity @s data.terf.nSpeed set value 0.1f
execute if block ~ ~ ~ #terf:neutron_no_slow run return fail
execute if block ~ ~ ~ gold_block run return run execute if predicate {"condition":"minecraft:random_chance","chance":0.00004} run setblock ~ ~ ~ minecraft:ancient_debris
execute if block ~ ~ ~ ancient_debris run return run execute if predicate {"condition":"minecraft:random_chance","chance":0.00004} run setblock ~ ~ ~ minecraft:diamond_block
execute if block ~ ~ ~ copper_block run return run execute if predicate {"condition":"minecraft:random_chance","chance":0.0001} run setblock ~ ~ ~ minecraft:coal_block
execute if block ~ ~ ~ sandstone run return run execute if predicate {"condition":"minecraft:random_chance","chance":0.00012} run setblock ~ ~ ~ minecraft:soul_sand
execute if block ~ ~ ~ wheat run return run execute if predicate {"condition":"minecraft:random_chance","chance":0.00004} run setblock ~ ~ ~ minecraft:nether_wart
execute if block ~ ~ ~ dried_ghast run return run execute if predicate {"condition":"minecraft:random_chance","chance":0.006} run function terf:entity/neutron/vaporize_dried_ghast
execute if block ~ ~ ~ oak_sapling run return run execute if predicate {"condition":"minecraft:random_chance","chance":0.000012} run setblock ~ ~ ~ minecraft:pale_oak_sapling
execute if block ~ ~ ~ skeleton_skull run return run execute if predicate {"condition":"minecraft:random_chance","chance":0.000012} run setblock ~ ~ ~ wither_skeleton_skull
execute if block ~ ~ ~ brown_mushroom run return run execute if predicate {"condition":"minecraft:random_chance","chance":0.000012} run setblock ~ ~ ~ warped_fungus
execute if block ~ ~ ~ red_mushroom run return run execute if predicate {"condition":"minecraft:random_chance","chance":0.000012} run setblock ~ ~ ~ crimson_fungus
execute if block ~ ~ ~ lapis_block run return run function terf:entity/neutron/reflect
execute if block ~ ~ ~ #terf:neutron_shield run return run kill @s
execute store result entity @s data.terf.nSpeed float 0.001 run data get entity @s data.terf.nSpeed 950
execute if block ~ ~ ~ water run particle bubble
