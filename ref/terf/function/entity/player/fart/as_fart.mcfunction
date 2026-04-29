#logic
execute store result score x2 terf_states run data get entity @s Pos[0] 100
execute store result score z2 terf_states run data get entity @s Pos[2] 100

data modify storage terf:temp args set value {arg1:'execute as @e[distance=..50,sort=furthest,tag=!terf_currententity,type=!marker] at @s anchored eyes positioned ^ ^ ^ if entity @e[type=minecraft:marker,tag=terf_fart,distance=..',arg3:'] run function terf:entity/player/fart/as_entity'}
execute store result storage terf:temp args.arg2 float 0.0008 run scoreboard players get scale terf_states
function datapipes_lib:require/with_args/3 with storage terf:temp args

#effects
scoreboard players operation temp terf_states = progress terf_states
scoreboard players operation temp terf_states %= 2 terf_states
execute unless score temp terf_states matches 0 run return run kill @s

#detect water
scoreboard players set water terf_states 0
execute if block ~ ~ ~ water run scoreboard players set water terf_states 1
execute if block ~ ~ ~ water_cauldron run scoreboard players set water terf_states 1

#particles
data modify storage terf:temp args set value {arg1:'particle minecraft:dust{color:[0,1,0],scale:',arg3:'} ~ ~ ~ 0 0 0 0 1 force'}
execute store result storage terf:temp args.arg2 float 0.001 run scoreboard players get scale terf_states
execute if score water terf_states matches 0 run function datapipes_lib:require/with_args/3 with storage terf:temp args

data modify storage terf:temp args set value {arg1:'particle minecraft:bubble ~ ~ ~ ',arg3:' ',arg5:' ',arg7:' 0 3 force'}
execute store result storage terf:temp args.arg2 float 0.00002 run scoreboard players get scale terf_states
execute store result storage terf:temp args.arg4 float 0.00002 run scoreboard players get scale terf_states
execute store result storage terf:temp args.arg6 float 0.00002 run scoreboard players get scale terf_states
execute if score water terf_states matches 1 run function datapipes_lib:require/with_args/7 with storage terf:temp args

#sound
data modify storage terf:temp args set value {arg1:'playsound terf:explosion.fart player @a[distance=0..] ~ ~ ~ ',arg3:' 1'}
execute if score water terf_states matches 1 run data modify storage terf:temp args set value {arg1:'playsound terf:explosion.fart player @a[distance=0..] ~ ~ ~ ',arg3:' 0.9'}
execute store result storage terf:temp args.arg2 float 0.0005 run scoreboard players get scale terf_states
function datapipes_lib:require/with_args/3 with storage terf:temp args

kill @s