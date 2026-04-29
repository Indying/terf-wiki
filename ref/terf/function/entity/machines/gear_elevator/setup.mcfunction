data modify entity @s data.terf.multiblock_function set value 'if block ~ ~1 ~ piston if block ~ ~2 ~ observer[facing=down] run return run function terf:entity/machines/gear_elevator/tick'

tag @s add terf_elevator
tag @s add datapipes_lib_power_consumer
scoreboard players set @s datapipes_lib_power_storage 0
scoreboard players set @s datapipes_lib_power_max 100
data modify entity @s data.power set value {checks:'if block ~ ~ ~ red_glazed_terracotta'}
