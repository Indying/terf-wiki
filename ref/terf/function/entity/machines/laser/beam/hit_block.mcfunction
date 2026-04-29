particle minecraft:flame ^ ^ ^-0.5 0.1 0.1 0.1 0.01 5 force

scoreboard players operation temp terf_states = power terf_states
scoreboard players operation temp terf_states %= 1000 terf_states
scoreboard players operation temp2 terf_states = power terf_states
scoreboard players operation temp2 terf_states /= 1000 terf_states

scoreboard players set succeeded terf_states 0
data modify storage terf:temp args2 set value {arg1:'execute if predicate {"condition":"minecraft:random_chance","chance":',arg3:'} run scoreboard players set succeeded terf_states 1'}
execute store result storage terf:temp args2.arg2 float 0.001 run scoreboard players get temp terf_states
function datapipes_lib:require/with_args/3 with storage terf:temp args2

execute if score temp2 terf_states matches 0 run return run execute if score succeeded terf_states matches 1 unless block ~ ~ ~ #terf:laser_resistant run setblock ~ ~ ~ air destroy

data modify storage terf:temp args2 set value {arg1:'summon creeper ~ ~ ~ {PersistenceRequired:1b,ignited:1,CustomName:"a High Power Laser",Fuse:1,ExplosionRadius:',arg3:'}'}
execute store result storage terf:temp args2.arg2 int 1 run scoreboard players get temp2 terf_states
execute if score succeeded terf_states matches 1 run return run function datapipes_lib:require/with_args/3 with storage terf:temp args2

scoreboard players remove temp2 terf_states 1

execute if score temp2 terf_states matches 0 run return run execute unless block ~ ~ ~ #terf:laser_resistant run setblock ~ ~ ~ air destroy

data modify storage terf:temp args2 set value {arg1:'summon creeper ~ ~ ~ {Invulnerable:1b,PersistenceRequired:1b,ignited:1,CustomName:"a High Power Laser",Fuse:1,ExplosionRadius:',arg3:'}'}
execute store result storage terf:temp args2.arg2 int 1 run scoreboard players get temp2 terf_states
function datapipes_lib:require/with_args/3 with storage terf:temp args2
