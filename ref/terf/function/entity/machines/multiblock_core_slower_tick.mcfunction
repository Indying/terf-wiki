execute if block ~ ~ ~ #minecraft:air run return run execute as @s[tag=terf_multicorebuffer,tag=!terf_indestructible,distance=..0.01] run function terf:entity/machines/multiblock_core_destroy
execute if entity @s[tag=!terf_multicorebuffer,tag=terf_rotated_multiblockcore] run function terf:entity/machines/multiblock_core_activate

execute if entity @s[tag=!terf_slower_ticked] run return fail
tag @s remove terf_alreadyconnected
function terf:entity/machines/multiblock_core_args with entity @s data.terf
