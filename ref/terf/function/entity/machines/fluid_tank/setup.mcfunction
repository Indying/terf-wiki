data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/fluid_tank/tick with entity @s data.terf.fluid_tank'
tag @s add terf_slower_ticked
tag @s add terf_fluid_tank
tag @s add datapipes_lib_fluid_generator
tag @s add fluid_priority_1

#rotate to face inside tank
execute if block ~ ~ ~-1 iron_trapdoor run rotate @s 180 0
execute if block ~ ~ ~1 iron_trapdoor run rotate @s 0 0
execute if block ~ ~-1 ~ iron_trapdoor run rotate @s 0 90
execute if block ~ ~1 ~ iron_trapdoor run rotate @s 0 -90
execute if block ~-1 ~ ~ iron_trapdoor run rotate @s 90 0
execute if block ~1 ~ ~ iron_trapdoor run rotate @s 270 0

#store iron trapdoor and observer
execute at @s run clone ^ ^ ^1 ^ ^ ^1 to terf:intermediary_technical_storage_dimension 29999999 0 29999999 replace move
execute at @s run clone ~ ~ ~ ~ ~ ~ to terf:intermediary_technical_storage_dimension 29999999 1 29999999 replace move
setblock ~ ~ ~ iron_block

#fill the area and generate an array of arrays of wall coordinates
scoreboard players set volume terf_states 0
data modify storage terf:temp args set value {array:[]}
summon marker ~ ~ ~ {UUID:[I;1101100,1101101,1100001,1101111]}

execute at @s positioned ^ ^ ^1 align xyz run function terf:entity/machines/fluid_tank/floodfill/step
execute at @s positioned ^ ^ ^1 run function terf:entity/machines/fluid_tank/floodfill/off_step

kill 0010cd2c-0010-cd2d-0010-c8e10010cd37

#bring back iron trapdoor and observer
execute at @s run clone from terf:intermediary_technical_storage_dimension 29999999 0 29999999 29999999 0 29999999 ^ ^ ^1 replace move
execute at @s run clone from terf:intermediary_technical_storage_dimension 29999999 1 29999999 29999999 1 29999999 ~ ~ ~ replace move

#transform the array of arrays into execute if
execute if score volume terf_states > max_tank_volume terf_states run return run data modify entity @s data.terf.error set value "Tank contains non-tank blocks, is leaking or over 1000 blocks in volume!"

data modify entity @s data.terf.fluid_tank.array set from storage terf:temp args.array

execute store result score x2 terf_states run data get entity @s Pos[0]
execute store result score y2 terf_states run data get entity @s Pos[1]
execute store result score z2 terf_states run data get entity @s Pos[2]

data modify storage terf:temp args.string set value ''
function terf:entity/machines/fluid_tank/transform/iterate

data modify entity @s data.terf.fluid_tank.checks set from storage terf:temp args.string

#add tank
data modify entity @s data.fluids append value {amount:0,changetype:"",id:"empty",pipe_on:'function terf:require/observer_output {cmd:"datapipes_lib:require/pipe_presets/lightning_rod/pipes_on"}',pipe_off:'function terf:require/observer_output {cmd:"datapipes_lib:require/pipe_presets/lightning_rod/pipes_off"}'}
scoreboard players operation volume terf_states *= 1000 terf_states
execute store result entity @s data.fluids[0].max int 1 run scoreboard players get volume terf_states

#set outpos
execute store result score x terf_states run data get storage terf:temp args.output[0]
execute store result score y terf_states run data get storage terf:temp args.output[1]
execute store result score z terf_states run data get storage terf:temp args.output[2]

scoreboard players operation x terf_states -= x2 terf_states
scoreboard players operation y terf_states -= y2 terf_states
scoreboard players operation z terf_states -= z2 terf_states

scoreboard players operation px terf_states = x terf_states
scoreboard players operation py terf_states = y terf_states
scoreboard players operation pz terf_states = z terf_states
scoreboard players operation mx terf_states = x terf_states
scoreboard players operation my terf_states = y terf_states
scoreboard players operation mz terf_states = z terf_states

scoreboard players add px terf_states 1
scoreboard players add py terf_states 1
scoreboard players add pz terf_states 1
scoreboard players remove mx terf_states 1
scoreboard players remove my terf_states 1
scoreboard players remove mz terf_states 1

data modify storage terf:temp args merge value {x2:0,y2:0,z2:0}
execute if block ~ ~ ~-1 iron_trapdoor run data modify storage terf:temp args.z2 set value 1
execute if block ~ ~ ~1 iron_trapdoor run data modify storage terf:temp args.z2 set value -1
execute if block ~ ~-1 ~ iron_trapdoor run data modify storage terf:temp args.y2 set value 1
execute if block ~ ~1 ~ iron_trapdoor run data modify storage terf:temp args.y2 set value -1
execute if block ~-1 ~ ~ iron_trapdoor run data modify storage terf:temp args.x2 set value 1
execute if block ~1 ~ ~ iron_trapdoor run data modify storage terf:temp args.x2 set value -1

execute store result storage terf:temp args.px int 1 run scoreboard players get px terf_states
execute store result storage terf:temp args.py int 1 run scoreboard players get py terf_states
execute store result storage terf:temp args.pz int 1 run scoreboard players get pz terf_states
execute store result storage terf:temp args.mx int 1 run scoreboard players get mx terf_states
execute store result storage terf:temp args.my int 1 run scoreboard players get my terf_states
execute store result storage terf:temp args.mz int 1 run scoreboard players get mz terf_states

execute store result storage terf:temp args.x int 1 run scoreboard players get x terf_states
execute store result storage terf:temp args.y int 1 run scoreboard players get y terf_states
execute store result storage terf:temp args.z int 1 run scoreboard players get z terf_states
function terf:entity/machines/fluid_tank/set_outpos with storage terf:temp args
