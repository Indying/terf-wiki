data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/breakers/tick'

tag @s add datapipes_lib_power_consumer
scoreboard players set @s datapipes_lib_power_max 0
scoreboard players add @s datapipes_lib_power_storage 0
data modify entity @s data.power set value {checks:'if block ^ ^-1 ^ red_glazed_terracotta'}