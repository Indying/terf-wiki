data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/diesel_generator/tick'

scoreboard players set @s terf_data_A 0
tag @s add datapipes_lib_power_generator
data modify entity @s data.power set value {outpos:"^ ^1 ^-5",checks:"if block ^ ^1 ^-5 red_glazed_terracotta"}
scoreboard players set @s datapipes_lib_power_max 600
scoreboard players set @s datapipes_lib_power_storage 0
