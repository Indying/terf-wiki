data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/shearing_press/tick'

tag @s add terf_shearing_press
tag @s add datapipes_lib_power_consumer
data modify entity @s data.power set value {checks:'if block ^ ^ ^-1 red_glazed_terracotta'}
scoreboard players add @s datapipes_lib_power_storage 0
scoreboard players set @s datapipes_lib_power_max 300

setblock ^1 ^1 ^ air
$summon block_display ^.501 ^.5 ^-.499 {interpolation_duration:20,Rotation:[$(rotation)f,0f],Tags:["terf_related_$(machine_id)"],block_state:{Name:"minecraft:iron_trapdoor",Properties:{facing:"south",open:"true"}}}
$data merge entity @e[type=block_display,tag=terf_related_$(machine_id),limit=1] {interpolation_duration:20}