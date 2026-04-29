execute if entity @s[tag=!terf_flammable] run return fail
tag @s remove terf_flammable
execute as @e[type=bat,tag=terf_flammable,distance=..7] at @s run function terf:entity/gases/explode

data modify storage terf:temp args set value {arg1:'summon minecraft:creeper ~ ~ ~ {Invulnerable:1,CustomNameVisible:0,PersistenceRequired:1b,CustomName:"a vapor cloud explosion",ignited:1b,Fuse:0,ExplosionRadius:',arg3:'}'}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get @s terf_data_B
function datapipes_lib:require/with_args/3 with storage terf:temp args
execute if score @s terf_data_B matches 4.. run playsound terf:explosion.huge_explosion master @a ~ ~ ~ 10 0