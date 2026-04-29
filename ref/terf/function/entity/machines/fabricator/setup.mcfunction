data modify entity @s data.terf.multiblock_function set value 'if block ^-1 ^ ^ crafting_table if block ^ ^1 ^ iron_trapdoor[open=false,half=top,waterlogged=false] if block ^ ^2 ^ polished_blackstone_stairs if block ^-1 ^2 ^ piston[facing=down] if block ^-1 ^3 ^ #terf:both/lightning_rod[facing=down] run function terf:entity/machines/fabricator/tick'

tag @s add datapipes_lib_power_consumer
scoreboard players set @s datapipes_lib_power_max 10000
data modify entity @s data.power set value {checks:'if block ^ ^ ^-1 red_glazed_terracotta'}
scoreboard players add @s datapipes_lib_power_storage 0
data modify block ~ ~ ~ CustomName set value "Fabricator"
