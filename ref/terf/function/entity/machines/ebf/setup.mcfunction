data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/ebf/tick'

tag @s add datapipes_lib_power_consumer
data modify entity @s data.power set value {checks:'if block ^ ^ ^-2 red_glazed_terracotta'}
scoreboard players set @s datapipes_lib_power_max 100000
scoreboard players add @s datapipes_lib_power_storage 0
data modify block ~ ~ ~ CustomName set value "Electric Blast Furnace: Input"
data modify block ^1 ^ ^-1 CustomName set value "Electric Blast Furnace: Output"
