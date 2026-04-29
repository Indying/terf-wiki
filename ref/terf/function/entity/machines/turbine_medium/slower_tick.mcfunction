scoreboard players set succeeded terf_states 0
execute if block ^ ^ ^1 brown_glazed_terracotta if block ^1 ^ ^1 brown_glazed_terracotta if block ^-1 ^ ^1 brown_glazed_terracotta if block ^ ^ ^-1 brown_glazed_terracotta if block ^1 ^ ^-1 brown_glazed_terracotta if block ^-1 ^ ^-1 brown_glazed_terracotta if block ^1 ^ ^ brown_glazed_terracotta if block ^-1 ^ ^ brown_glazed_terracotta if block ^ ^2 ^1 brown_glazed_terracotta if block ^1 ^2 ^1 brown_glazed_terracotta if block ^-1 ^2 ^1 brown_glazed_terracotta if block ^ ^2 ^-1 brown_glazed_terracotta if block ^1 ^2 ^-1 brown_glazed_terracotta if block ^-1 ^2 ^-1 brown_glazed_terracotta if block ^1 ^2 ^ brown_glazed_terracotta if block ^-1 ^2 ^ brown_glazed_terracotta if block ^1 ^1 ^ brown_glazed_terracotta if block ^-1 ^1 ^ brown_glazed_terracotta if block ^1 ^1 ^1 brown_glazed_terracotta if block ^-1 ^1 ^1 brown_glazed_terracotta if block ^1 ^1 ^-1 brown_glazed_terracotta if block ^-1 ^1 ^-1 brown_glazed_terracotta if block ^ ^1 ^ smooth_stone if block ^ ^1 ^1 smooth_stone if block ^ ^1 ^-1 smooth_stone if block ^1 ^3 ^ granite_slab if block ^-1 ^3 ^ granite_slab if block ^1 ^-1 ^ granite_slab if block ^-1 ^-1 ^ granite_slab if block ^-2 ^ ^1 granite_slab if block ^2 ^ ^1 granite_slab if block ^-2 ^ ^-1 granite_slab if block ^2 ^ ^-1 granite_slab if block ^-2 ^1 ^1 granite_slab if block ^2 ^1 ^1 granite_slab if block ^-2 ^1 ^-1 granite_slab if block ^2 ^1 ^-1 granite_slab if block ^-2 ^2 ^1 granite_slab if block ^2 ^2 ^1 granite_slab if block ^-2 ^2 ^-1 granite_slab if block ^2 ^2 ^-1 granite_slab if block ^-1 ^-1 ^-1 granite_stairs if block ^-1 ^-1 ^1 granite_stairs if block ^1 ^-1 ^-1 granite_stairs if block ^1 ^-1 ^1 granite_stairs if block ^-2 ^-1 ^-1 granite_stairs if block ^-2 ^-1 ^1 granite_stairs if block ^2 ^-1 ^-1 granite_stairs if block ^2 ^-1 ^1 granite_stairs if block ^-2 ^3 ^-1 granite_stairs if block ^-2 ^3 ^1 granite_stairs if block ^2 ^3 ^-1 granite_stairs if block ^2 ^3 ^1 granite_stairs if block ^-2 ^3 ^-1 granite_stairs if block ^-2 ^3 ^1 granite_stairs if block ^2 ^3 ^-1 granite_stairs if block ^2 ^3 ^1 granite_stairs if block ^2 ^ ^ iron_trapdoor if block ^-2 ^ ^ iron_trapdoor if block ^2 ^1 ^ iron_trapdoor if block ^-2 ^1 ^ iron_trapdoor if block ^2 ^2 ^ iron_trapdoor if block ^-2 ^2 ^ iron_trapdoor if block ^ ^2 ^ waxed_chiseled_copper run scoreboard players set succeeded terf_states 1
execute if score succeeded terf_states matches 0 run return fail

#load values from fluid nbt
data modify storage terf:temp temp set from entity @s data.fluids
execute store result score steam_amount terf_states run data get storage terf:temp temp[0].amount
execute store result score water_amount terf_states run data get storage terf:temp temp[1].amount

#check the drums
scoreboard players set @s terf_data_B -1
scoreboard players set length terf_states 0
data modify storage terf:temp args set value {steam_checks:'',water_checks:''}
execute positioned ^ ^1 ^4 run function terf:entity/machines/turbine_medium/check_drums

#check for power output location
scoreboard players set x terf_states 0
scoreboard players set y terf_states 1
execute positioned ~ ~1 ~ run function terf:entity/machines/turbine_large/shaft_check_start

#set max amounts of stuff
scoreboard players operation @s datapipes_lib_power_max = @s terf_data_B
scoreboard players operation @s datapipes_lib_power_max *= medium_turbine_mw_per_drum terf_states
scoreboard players operation temp terf_states = medium_turbine_steam_per_drum terf_states
scoreboard players operation temp terf_states *= @s terf_data_B
execute store result storage terf:temp temp[0].max int 1 run scoreboard players get temp terf_states
data modify storage terf:temp temp[1].max set from storage terf:temp temp[0].max

#convert steam to water
scoreboard players operation temp terf_states = steam_amount terf_states
scoreboard players operation temp terf_states /= 40 terf_states
scoreboard players operation water_amount terf_states += temp terf_states

scoreboard players operation temp terf_states *= 40 terf_states
scoreboard players operation steam_amount terf_states -= temp terf_states

execute if score water_amount terf_states matches 1001.. run scoreboard players set water_amount terf_states 1000
execute if score steam_amount terf_states matches ..-1 run scoreboard players set steam_amount terf_states 0

scoreboard players operation @s terf_data_A = temp terf_states
scoreboard players operation @s terf_data_A /= medium_turbine_gen_divider terf_states
scoreboard players operation @s terf_data_A *= NETrate terf_states
scoreboard players operation @s datapipes_lib_power_storage += @s terf_data_A
execute if score @s datapipes_lib_power_storage > @s datapipes_lib_power_max run scoreboard players operation @s datapipes_lib_power_storage = @s datapipes_lib_power_max

#save values tp fluid nbt
data modify storage terf:temp temp[0].checks set string storage terf:temp args.steam_checks 1
data modify storage terf:temp temp[1].checks set string storage terf:temp args.water_checks 1

execute store result storage terf:temp temp[0].amount int 1 run scoreboard players get steam_amount terf_states
execute store result storage terf:temp temp[1].amount int 1 run scoreboard players get water_amount terf_states
data modify entity @s data.fluids set from storage terf:temp temp
