data modify entity @s data.terf.multiblock_function set value 'if block ^ ^1 ^ granite_slab[type=double] if block ^ ^2 ^ diorite_wall if block ^ ^-1 ^ polished_deepslate_wall if block ^ ^-2 ^ waxed_lightning_rod[facing=up] run return run function terf:entity/machines/magma_drill/tick'

tag @s add datapipes_lib_fluid_generator
tag @s add datapipes_lib_power_consumer
tag @s add fluid_filter_terf.mineral_magma
data modify entity @s data.power set value {checks:'if block ^ ^1 ^ red_glazed_terracotta'}
scoreboard players add @s datapipes_lib_power_storage 0
scoreboard players set @s datapipes_lib_power_max 7000
execute unless data entity @s data.fluids[{id:terf.mineral_magma}] run data modify entity @s data.fluids append value {max:1000,amount:0,id:"terf.mineral_magma",outpos:"^ ^3 ^",checks:"if block ^ ^3 ^ red_glazed_terracotta",pipe_on:"function datapipes_lib:require/custom_pipe/pipes_on {axis:quartz_pillar,corner:chiseled_quartz_block}",pipe_off:"function datapipes_lib:require/custom_pipe/pipes_off {axis:quartz_pillar,corner:chiseled_quartz_block}"}
