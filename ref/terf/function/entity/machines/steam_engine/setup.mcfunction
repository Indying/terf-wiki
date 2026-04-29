tag @s add datapipes_lib_power_generator
data modify entity @s data.power set value {outpos:"^ ^-2 ^-1",checks:"if block ^ ^-2 ^-1 red_glazed_terracotta"}
scoreboard players set @s datapipes_lib_power_max 200
scoreboard players set @s datapipes_lib_power_storage 0
scoreboard players set @s terf_data_A 1

data modify entity @s data.terf.multiblock_function set value "if block ~ ~ ~ grindstone if block ~ ~-1 ~ decorated_pot if block ~ ~-2 ~ petrified_oak_slab[type=top] if block ^-1 ^-1 ^ #minecraft:cauldrons run function terf:entity/machines/steam_engine/tick"