data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/large_fluid_solidifier/tick'

tag @s add fluid_filter_terf.mineral_magma
data modify entity @s data.fluids append value {max:2000,amount:0,changetype:"",id:"terf.mineral_magma",outpos:"^ ^4 ^",checks:"if block ^ ^4 ^ red_glazed_terracotta"}
