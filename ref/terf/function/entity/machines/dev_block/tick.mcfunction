#COMMANDS:
#infinite power = infinite power (obviously)

data modify entity @s data.power set value {outpos:"~ ~1 ~",checks:'if block ~ ~1 ~ red_glazed_terracotta'}
scoreboard players set @s datapipes_lib_power_max 6942000
scoreboard players set @s datapipes_lib_power_storage 6942000

tag @s remove datapipes_lib_power_generator

execute if data block ~ ~ ~ {Command:"infinite power"} run tag @s add datapipes_lib_power_generator
