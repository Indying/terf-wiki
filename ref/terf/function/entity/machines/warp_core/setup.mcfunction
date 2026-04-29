data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/warp_core/tick with entity @s data.terf'
data modify entity @s data.terf.destruction_override set value "function terf:entity/machines/warp_core/destruction_override"

tag @s add datapipes_lib_power_consumer
scoreboard players set @s datapipes_lib_power_max 4000000
scoreboard players set @s datapipes_lib_power_storage 0
data modify entity @s data.power set value {checks:'if block ^ ^ ^-3 red_glazed_terracotta if block ^-3 ^ ^ red_glazed_terracotta if block ^3 ^ ^ red_glazed_terracotta'}

scoreboard players set @s terf_data_A 0

data modify entity @s data.terf.dim set value "minecraft:overworld"
data modify entity @s data.terf.machine_name set value "warp_core"
data modify entity @s data.terf.mainframe_logistics.config set value {input_coords:"^ ^ ^3",is_output:1,load:5}

tag @s add terf_warp_core
tag @s add terf_mainframe_interested
tag @s add terf_setup