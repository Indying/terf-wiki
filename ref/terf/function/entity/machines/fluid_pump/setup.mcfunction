data modify entity @s data.terf.multiblock_function set value 'if block ~ ~-1 ~ cauldron if block ~ ~1 ~ granite_slab[type=double] if block ^ ^ ^1 observer run return run function terf:entity/machines/fluid_pump/slower_tick'
tag @s add terf_slower_ticked

tag @s add datapipes_lib_power_consumer
tag @s add datapipes_lib_fluid_generator
tag @s add terf_fluid_pump
data modify entity @s data.power set value {checks:'if block ^ ^1 ^ red_glazed_terracotta'}
scoreboard players add @s datapipes_lib_power_storage 0
scoreboard players set @s datapipes_lib_power_max 300