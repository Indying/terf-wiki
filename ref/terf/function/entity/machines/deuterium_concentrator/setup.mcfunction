data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/deuterium_concentrator/tick'

data modify entity @s data.power set value {checks:'if block ^ ^ ^-2 red_glazed_terracotta'}
tag @s add datapipes_lib_power_consumer
scoreboard players set @s datapipes_lib_power_max 400
scoreboard players set @s datapipes_lib_power_storage 0

scoreboard players set @s terf_data_A 0
tag @s add datapipes_lib_fluid_generator
tag @s add fluid_filter_water
tag @s add fluid_filter_terf.depleted_water
tag @s add fluid_filter_terf.heavy_water
data modify entity @s data.fluids append value {max:10000,amount:0,id:"water",changetype:"",outpos:"^-1 ^ ^",checks:"positioned ^-1 ^ ^ if function terf:require/observer_fluid_checks"}
data modify entity @s data.fluids append value {max:10000,amount:0,id:"terf.depleted_water",outpos:"^1 ^ ^",checks:"positioned ^1 ^ ^ if function terf:require/observer_fluid_checks",pipe_on:'function terf:require/observer_output {cmd:"datapipes_lib:require/pipe_presets/lightning_rod/pipes_on"}',pipe_off:'function terf:require/observer_output {cmd:"datapipes_lib:require/pipe_presets/lightning_rod/pipes_off"}'}
data modify entity @s data.fluids append value {max:1000,amount:0,id:"terf.heavy_water",outpos:"^ ^5 ^-1",checks:"positioned ^ ^5 ^-1 if function terf:require/observer_fluid_checks",pipe_on:'function terf:require/observer_output {cmd:"datapipes_lib:require/custom_pipe/pipes_on {axis:polished_basalt,corner:smooth_basalt}"}',pipe_off:'function terf:require/observer_output {cmd:"datapipes_lib:require/custom_pipe/pipes_off {axis:polished_basalt,corner:smooth_basalt}"}'}
