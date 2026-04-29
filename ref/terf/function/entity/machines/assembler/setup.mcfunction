data modify entity @s data.terf.multiblock_function set value 'positioned ^2.4999 ^-0.4999 ^-4.4999 run function terf:entity/machines/assembler/tick'

tag @s add terf_assembler
tag @s add datapipes_lib_power_consumer
data modify entity @s data.power set value {checks:"if block ^2 ^7 ^-8 red_glazed_terracotta"}
scoreboard players add @s datapipes_lib_power_storage 0
scoreboard players set @s datapipes_lib_power_max 5000000

data modify block ~ ~ ~ CustomName set value "Assembler"

tag @s add terf_mainframe_interested
data modify entity @s data.terf.mainframe_logistics.config set value {input_coords:"^3 ^7 ^-8",load:21}
