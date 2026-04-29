data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/multi_piston/tick'

execute if block ~ ~ ~ minecraft:dispenser[facing=south] run rotate @s 0 0
execute if block ~ ~ ~ minecraft:dispenser[facing=west] run rotate @s 90 0
execute if block ~ ~ ~ minecraft:dispenser[facing=north] run rotate @s 180 0
execute if block ~ ~ ~ minecraft:dispenser[facing=east] run rotate @s -90 0
execute if block ~ ~ ~ minecraft:dispenser[facing=up] run rotate @s 0 -90
execute if block ~ ~ ~ minecraft:dispenser[facing=down] run rotate @s 0 90
