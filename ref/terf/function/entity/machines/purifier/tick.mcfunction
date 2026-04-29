#terf_data_A = cooldown of block 1
#terf_data_B = cooldown of block 2

execute unless score @s datapipes_lib_power_storage matches 5.. run return fail

execute if score NETratetimer terf_states >= NETrate terf_states run tag @s remove terf_purifiercase
execute if score NETratetimer terf_states >= NETrate terf_states if block ^ ^ ^1 water[level=0] if block ^ ^ ^1 water[level=0] if block ^1 ^ ^1 water[level=0] if block ^1 ^ ^ waxed_oxidized_cut_copper if block ^1 ^-1 ^1 waxed_oxidized_cut_copper if block ^ ^-1 ^1 waxed_oxidized_cut_copper if block ^ ^ ^2 iron_trapdoor[open=true] if block ^2 ^ ^1 iron_trapdoor[open=true] if block ^1 ^ ^2 iron_trapdoor[open=true] if block ^-1 ^ ^1 waxed_cut_copper if block ^-1 ^1 ^1 waxed_cut_copper if block ^-1 ^2 ^1 waxed_cut_copper if block ^-1 ^3 ^1 waxed_cut_copper_stairs if block ^ ^3 ^1 waxed_cut_copper_stairs if block ^1 ^3 ^1 waxed_cut_copper_slab if block ^ ^2 ^1 iron_bars if block ^1 ^2 ^1 iron_bars run tag @s add terf_purifiercase
execute unless entity @s[tag=terf_purifiercase] run return fail

scoreboard players remove @s datapipes_lib_power_storage 5

execute unless block ^ ^1 ^1 air run scoreboard players add @s terf_data_A 1
execute if block ^ ^1 ^1 air run scoreboard players set @s terf_data_A 0
execute if score @s terf_data_A matches 200.. positioned ^ ^1 ^1 run function terf:entity/machines/purifier/operation

execute unless block ^1 ^1 ^1 air run scoreboard players add @s terf_data_B 1
execute if block ^1 ^1 ^1 air run scoreboard players set @s terf_data_B 0
execute if score @s terf_data_B matches 200.. positioned ^1 ^1 ^1 run function terf:entity/machines/purifier/operation

particle minecraft:poof ^ ^.5 ^1 0.2 0.2 0.2 0.05 1
particle minecraft:poof ^1 ^.5 ^1 0.2 0.2 0.2 0.05 1
playsound minecraft:block.sand.break master @a[distance=0..] ~ ~ ~ 0.5 2