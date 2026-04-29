tag @s remove large_fluid_solidifier_case
execute if block ^ ^-1 ^ brown_glazed_terracotta if block ^1 ^-1 ^ brown_glazed_terracotta if block ^-1 ^-1 ^ brown_glazed_terracotta if block ^ ^-1 ^1 brown_glazed_terracotta if block ^ ^-1 ^-1 brown_glazed_terracotta if block ^1 ^-1 ^1 brown_glazed_terracotta if block ^-1 ^-1 ^-1 brown_glazed_terracotta if block ^1 ^-1 ^-1 brown_glazed_terracotta if block ^-1 ^-1 ^1 brown_glazed_terracotta if block ^1 ^ ^ granite_stairs if block ^-1 ^ ^ granite_stairs if block ^1 ^1 ^ granite_wall if block ^-1 ^1 ^ granite_wall if block ^1 ^2 ^ granite_wall if block ^-1 ^2 ^ granite_wall if block ^ ^2 ^ decorated_pot if block ^ ^3 ^ hopper if block ^ ^3 ^1 sticky_piston if block ^ ^3 ^-1 waxed_cut_copper_slab if block ^1 ^3 ^ waxed_cut_copper_slab if block ^-1 ^3 ^ waxed_cut_copper_slab if block ^ ^1 ^-1 piston if block ^1 ^1 ^1 polished_deepslate_stairs if block ^-1 ^1 ^1 polished_deepslate_stairs if block ^1 ^2 ^1 polished_deepslate_stairs if block ^-1 ^2 ^1 polished_deepslate_stairs if block ^1 ^ ^-1 polished_deepslate if block ^-1 ^ ^-1 polished_deepslate if block ^1 ^1 ^-1 polished_deepslate if block ^-1 ^1 ^-1 polished_deepslate if block ^1 ^2 ^-1 polished_deepslate_stairs if block ^-1 ^2 ^-1 polished_deepslate_stairs run tag @s add large_fluid_solidifier_case
execute unless entity @s[tag=large_fluid_solidifier_case] run return fail

#recipe checks
data modify storage terf:temp args2 set value {name:"large_fluid_solidifier",a:"z"}
data modify storage terf:temp args2.a set from entity @s data.fluids[0].id

function terf:require/read_1_recipes with storage terf:temp args2

execute store result score aa terf_states run data get entity @s data.fluids[0].amount
execute store result score a terf_states run data get storage terf:temp output.a
execute if data storage terf:temp output.z if score aa terf_states >= a terf_states run function terf:entity/machines/large_fluid_solidifier/activated with storage terf:temp output
