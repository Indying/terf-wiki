data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/crusher/tick'

tag @s add datapipes_lib_power_consumer
data modify entity @s data.power set value {checks:'if block ^1 ^ ^ red_glazed_terracotta'}
scoreboard players set @s datapipes_lib_power_max 1000
scoreboard players add @s datapipes_lib_power_storage 0
data modify block ~ ~ ~ CustomName set value "Crusher: output"
data modify block ~ ~ ~ disabled_slots set value [I;0,1,2,3,5,6,7,8]