data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/hadron_collider/tick'

tag @s add terf_hadron_collider
tag @s add datapipes_lib_power_consumer
data modify entity @s data.power set value {checks:'if block ^ ^4 ^ red_glazed_terracotta'}
scoreboard players add @s datapipes_lib_power_storage 0
scoreboard players set @s datapipes_lib_power_max 100000
scoreboard players set @s terf_data_D 1
