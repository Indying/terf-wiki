data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/rolling_mill/tick'

tag @s add datapipes_lib_power_consumer
data modify entity @s data.power set value {checks:'if block ^ ^1 ^-2 red_glazed_terracotta'}
scoreboard players add @s datapipes_lib_power_storage 0
scoreboard players set @s datapipes_lib_power_max 600
