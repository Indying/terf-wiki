#terf_data_A = progress

execute unless score @s terf_data_A = @s terf_data_A run function terf:entity/machines/electrolyzer/setup

tag @s remove terf_electrolyzer_case
execute if block ^ ^ ^1 minecraft:brown_glazed_terracotta if block ^-1 ^ ^-1 minecraft:brown_glazed_terracotta if block ^1 ^ ^-1 minecraft:brown_glazed_terracotta if block ^ ^ ^-1 observer if block ^1 ^ ^1 observer if block ^-1 ^ ^1 observer if block ^1 ^1 ^ iron_block if block ^-1 ^1 ^ iron_block if block ^1 ^2 ^ iron_block if block ^-1 ^2 ^ iron_block if block ^1 ^1 ^-1 granite_wall if block ^1 ^2 ^-1 granite_wall if block ^-1 ^1 ^-1 granite_wall if block ^-1 ^2 ^-1 granite_wall if block ^-1 ^3 ^-1 quartz_stairs if block ^1 ^3 ^-1 quartz_stairs if block ^1 ^3 ^ quartz_stairs if block ^-1 ^3 ^ quartz_stairs run tag @s add terf_electrolyzer_case
execute if entity @s[tag=!terf_electrolyzer_case] run return fail

execute store result score fluid_amount terf_states run data get entity @s data.fluids[0].amount
execute if score fluid_amount terf_states matches 0 run return fail

data modify storage terf:temp args set value {name:"electrolyzer",a:"z"}
data modify storage terf:temp args.a set from entity @s data.fluids[0].id

function terf:require/read_1_recipes with storage terf:temp args
execute store result score a terf_states run data get storage terf:temp output.a

execute if data storage terf:temp output.1 if score fluid_amount terf_states >= a terf_states run function terf:entity/machines/electrolyzer/activated with storage terf:temp output
