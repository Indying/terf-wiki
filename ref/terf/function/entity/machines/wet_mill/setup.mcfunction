data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/wet_mill/tick'

tag @s add datapipes_lib_fluid_generator
tag @s add datapipes_lib_power_consumer
data modify entity @s data.power set value {checks:'if block ^ ^2 ^ red_glazed_terracotta'}
scoreboard players set @s datapipes_lib_power_max 600
scoreboard players add @s datapipes_lib_power_storage 0
data modify entity @s data.fluids append value {max:1000,amount:0,id:"empty",outpos:"^ ^-1 ^",checks:"if block ^ ^-1 ^ red_glazed_terracotta",pipe_on:'function datapipes_lib:require/pipe_presets/lightning_rod/pipes_on',pipe_off:'function datapipes_lib:require/pipe_presets/lightning_rod/pipes_off'}
