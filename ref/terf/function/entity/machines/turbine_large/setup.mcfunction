data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/turbine_large/tick'

#add tags and data for integration
tag @s add terf_mainframe_interested
tag @s add datapipes_lib_power_generator
tag @s add datapipes_lib_fluid_generator
tag @s add fluid_filter_terf.high_pressure_steam
tag @s add fluid_filter_water
scoreboard players set @s datapipes_lib_power_max 180000

data modify entity @s data.terf.mainframe_logistics.config set value {input_coords:"^ ^2 ^",is_input:1,load:1}
execute unless data entity @s data.fluids[{id:terf.high_pressure_steam}] run data modify entity @s data.fluids append value {max:5000,amount:0,id:"terf.high_pressure_steam",outpos:"^ ^2 ^1",checks:"if block ^ ^2 ^1 red_glazed_terracotta if block ^ ^2 ^-1 red_glazed_terracotta if block ^ ^-2 ^1 red_glazed_terracotta if block ^ ^-2 ^-1 red_glazed_terracotta if block ^2 ^ ^1 red_glazed_terracotta if block ^2 ^ ^-1 red_glazed_terracotta if block ^-2 ^ ^1 red_glazed_terracotta if block ^-2 ^ ^-1 red_glazed_terracotta"}
execute unless data entity @s data.fluids[{id:water}] run data modify entity @s data.fluids append value {max:1000,amount:0,id:"water",outpos:"^1 ^-1 ^7",checks:"if block ^1 ^-1 ^7 red_glazed_terracotta if block ^-1 ^-1 ^7 red_glazed_terracotta if block ^1 ^1 ^7 red_glazed_terracotta if block ^1 ^-1 ^-9 red_glazed_terracotta if block ^-1 ^1 ^-9 red_glazed_terracotta if block ^-1 ^-1 ^-9 red_glazed_terracotta if block ^1 ^1 ^-9 red_glazed_terracotta",pipe_on:"function datapipes_lib:require/custom_pipe/pipes_on {axis:polished_basalt,corner:smooth_basalt}",pipe_off:"function datapipes_lib:require/custom_pipe/pipes_off {axis:polished_basalt,corner:smooth_basalt}"}
data modify entity @s data.terf.machine_name set value "large_turbine"
