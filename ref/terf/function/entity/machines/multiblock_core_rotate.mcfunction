execute at @s align xyz run tp @s ~.5 ~.5 ~.5

tag @s add terf_currententity
execute at @s positioned ~-.5 ~-.5 ~-.5 if entity @e[tag=!terf_currententity,dx=0,dy=0,dz=0,type=minecraft:marker,tag=terf_multiblockcore] positioned ~.5 ~.5 ~.5 run return run function terf:entity/machines/multiblock_core_destroy
tag @s remove terf_currententity

data modify entity @s Rotation[1] set value 0f
execute store result score temp terf_states run data get storage terf:temp temp 1
scoreboard players add temp terf_states 180
scoreboard players add temp terf_states 45
scoreboard players operation temp terf_states /= 90 terf_states
scoreboard players operation temp terf_states *= 90 terf_states
execute store result entity @s Rotation[0] float 1 run scoreboard players get temp terf_states
scoreboard players reset @a terf_usedcreeperspawnegg
tag @s add terf_rotated_multiblockcore

data modify storage terf:temp args set value {arg1:'summon minecraft:item_display ~ ~-.5 ~ {item:{id:"minecraft:creeper_spawn_egg",components:{item_model:"terf:visual/multiblock_core"}},Tags:["terf_multiblock_core_display"],Rotation:[', arg3:'f,0f]}'}
execute store result storage terf:temp args.arg2 float 1 run scoreboard players get temp terf_states
execute at @s run function datapipes_lib:require/with_args/3 with storage terf:temp args
execute at @s run playsound minecraft:block.heavy_core.place master @a[distance=0..]
