data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/charging_station/tick'

data modify entity @s data.power set value {checks:'if block ^ ^2 ^ red_glazed_terracotta'}
tag @s add datapipes_lib_power_consumer
data modify block ~ ~ ~ CustomName set value "Charging Station"