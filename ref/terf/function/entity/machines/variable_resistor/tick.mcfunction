tag @s add datapipes_lib_power_generator
tag @s add datapipes_lib_power_consumer
data modify entity @s data.power set value {outpos:"^ ^ ^1",checks:"if block ^ ^ ^-1 minecraft:red_glazed_terracotta"}
scoreboard players set @s datapipes_lib_power_max 100000