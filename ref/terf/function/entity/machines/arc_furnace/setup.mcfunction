data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/arc_furnace/tick'

tag @s add datapipes_lib_power_consumer
scoreboard players set @s datapipes_lib_power_max 1600
data modify entity @s data.power set value {checks:'if block ^ ^2 ^-1 red_glazed_terracotta'}
scoreboard players add @s datapipes_lib_power_storage 0