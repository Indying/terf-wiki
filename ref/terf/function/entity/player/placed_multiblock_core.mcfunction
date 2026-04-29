data modify storage terf:temp temp set from entity @s Rotation[0]
execute as @e[type=marker,tag=terf_multiblockcore,tag=!terf_rotated_multiblockcore,distance=..10] run function terf:entity/machines/multiblock_core_rotate
scoreboard players set @s terf_usedcreeperspawnegg 0