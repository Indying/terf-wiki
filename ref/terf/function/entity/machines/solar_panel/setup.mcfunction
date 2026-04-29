data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/solar_panel/tick'
data modify entity @s data.terf.after_warp set value 'run function terf:entity/machines/solar_panel/update'

scoreboard players set @s terf_data_A 0
tag @s add terf_solar_panel
tag @s add terf_slower_ticked
tag @s add datapipes_lib_power_generator
data modify entity @s data.power set value {outpos:"^1 ^ ^",checks:"if block ^1 ^ ^ red_glazed_terracotta"}
scoreboard players set @s datapipes_lib_power_max 0
scoreboard players set @s datapipes_lib_power_storage 0
