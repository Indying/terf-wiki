execute align xyz run tp @s ~.5 ~.5 ~.5

tag @s add terf_currententity
execute at @s positioned ~-.5 ~-.5 ~-.5 if entity @e[tag=!terf_currententity,dx=0,dy=0,dz=0,type=minecraft:marker,tag=terf_multiblockcore] positioned ~.5 ~.5 ~.5 run return run function terf:entity/machines/multiblock_core_destroy
tag @s remove terf_currententity

#set rotation transformation matrix for some machines that need it
execute store result score rotation terf_states run data get entity @s Rotation[0]
execute store result entity @s data.terf.rotation int 1 run scoreboard players get rotation terf_states

scoreboard players operation temp terf_states = rotation terf_states
scoreboard players add temp terf_states 90
execute store result entity @s data.terf.rotation_left int 1 run scoreboard players get temp terf_states

scoreboard players operation temp terf_states = rotation terf_states
scoreboard players remove temp terf_states 90
execute store result entity @s data.terf.rotation_right int 1 run scoreboard players get temp terf_states

scoreboard players operation temp terf_states = rotation terf_states
scoreboard players add temp terf_states 180
execute store result entity @s data.terf.rotation_back int 1 run scoreboard players get temp terf_states

execute if score rotation terf_states matches 0 run data modify entity @s data.terf merge value {RTMsouth:"south",RTMeast:"east",RTMnorth:"north",RTMwest:"west"}
execute if score rotation terf_states matches 90 run data modify entity @s data.terf merge value {RTMsouth:"west",RTMeast:"south",RTMnorth:"east",RTMwest:"north"}
execute if score rotation terf_states matches 180 run data modify entity @s data.terf merge value {RTMsouth:"north",RTMeast:"west",RTMnorth:"south",RTMwest:"east"}
execute if score rotation terf_states matches 270 run data modify entity @s data.terf merge value {RTMsouth:"east",RTMeast:"north",RTMnorth:"west",RTMwest:"south"}

particle minecraft:electric_spark ~ ~ ~ 0 0 0 1 100 force
tag @s add terf_multicorebuffer

playsound minecraft:block.beacon.activate block @a[distance=0..] ~ ~ ~ 1 2
scoreboard players add currentcoreid terf_states 1
scoreboard players operation @s terf_scorelink = currentcoreid terf_states

data modify storage terf:temp args set value {arg1:"tag @s add terf_machineid_"}
execute store result storage terf:temp args.arg2 double 1 run scoreboard players get @s terf_scorelink
data modify entity @s data.terf.machine_id set from storage terf:temp args.arg2
function datapipes_lib:require/with_args/2 with storage terf:temp args

kill @e[tag=terf_multiblock_core_display,distance=..0.6]

#run setup functions of machines
data modify storage terf:temp temp set from storage terf:constants mb_setup_functions
execute at @s run function terf:entity/machines/multiblock_core_setup_iterate with storage terf:temp temp[0]