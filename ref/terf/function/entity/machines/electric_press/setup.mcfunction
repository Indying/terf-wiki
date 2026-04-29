data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/electric_press/tick'

tag @s add datapipes_lib_power_consumer
data modify entity @s data.power set value {checks:'if block ^ ^4 ^ red_glazed_terracotta'}
scoreboard players set @s datapipes_lib_power_max 45000
scoreboard players add @s datapipes_lib_power_storage 0
