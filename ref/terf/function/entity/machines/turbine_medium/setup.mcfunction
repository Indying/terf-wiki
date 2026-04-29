data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/turbine_medium/tick'

#add tags and data for integration
tag @s add terf_mainframe_interested
tag @s add datapipes_lib_power_generator
tag @s add datapipes_lib_fluid_generator
tag @s add fluid_filter_terf.high_pressure_steam
tag @s add fluid_filter_water

data modify entity @s data.terf.mainframe_logistics.config set value {load:1,input_coords:'^ ^2 ^'}
execute unless data entity @s data.fluids[{id:terf.high_pressure_steam}] run data modify entity @s data.fluids append value {max:5000,amount:0,id:"terf.high_pressure_steam",outpos:"",checks:""}
execute unless data entity @s data.fluids[{id:water}] run data modify entity @s data.fluids append value {max:1000,amount:0,id:"water",outpos:"",checks:"",pipe_on:"function datapipes_lib:require/custom_pipe/pipes_on {axis:polished_basalt,corner:smooth_basalt}",pipe_off:"function datapipes_lib:require/custom_pipe/pipes_off {axis:polished_basalt,corner:smooth_basalt}"}
data modify entity @s data.terf.machine_name set value "medium_turbine"
