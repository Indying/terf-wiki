tag @s add terf_exploded

data modify storage terf:temp args set value {arg1:'summon tnt ~ ~ ~ {fuse:2,Motion:[',arg3:'d,',arg5:'d,',arg7:'d]}'}
execute store result storage terf:temp args.arg2 float 0.01 run random value -500..500
execute store result storage terf:temp args.arg4 float 0.01 run random value 0..1000
execute store result storage terf:temp args.arg6 float 0.01 run random value -500..500
function datapipes_lib:require/with_args/7 with storage terf:temp args

scoreboard players add temp terf_states 1
fill ~-1 ~ ~-1 ~1 ~15 ~1 air replace water
particle minecraft:explosion ~ ~ ~ 0 0 0 0 1 force
setblock ~ ~ ~ air
kill @s
execute as @e[type=minecraft:marker,tag=terf_fuel_rod,tag=!terf_exploded,distance=..3] at @s run function terf:entity/machines/fission_reactor/explode_core_tag