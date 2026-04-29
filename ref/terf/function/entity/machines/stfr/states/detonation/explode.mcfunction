scoreboard players add temp terf_states 1

fill ~10 ~10 ~10 ~-10 ~-10 ~-10 air replace water

execute positioned ~ ~ ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air
execute positioned ~1 ~ ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air
execute positioned ~-1 ~ ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air
execute positioned ~ ~1 ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air
execute positioned ~ ~-1 ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air
execute positioned ~ ~ ~1 unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air
execute positioned ~ ~ ~-1 unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air

execute positioned ~1 ~1 ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air
execute positioned ~-1 ~1 ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air
execute positioned ~ ~1 ~1 unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air
execute positioned ~ ~1 ~-1 unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air
execute positioned ~1 ~-1 ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air
execute positioned ~-1 ~-1 ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air
execute positioned ~ ~-1 ~1 unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air
execute positioned ~ ~-1 ~-1 unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air

execute store success score succeeded terf_states run forceload query ~ ~
execute if score succeeded terf_states matches 0 run return fail

execute as @s[tag=terf_core_online] if predicate datapipes_lib:chances/50 positioned ^ ^ ^-1 run return run summon minecraft:creeper ~ ~.5 ~ {Invulnerable:1,ExplosionRadius:127,Fuse:0,ignited:1,CustomName:"a High Energy Fusion Explosion",CustomNameVisible:0,PersistenceRequired:1b}
execute as @s[tag=terf_core_online] positioned ^ ^ ^-1 run return run summon minecraft:creeper ~ ~-.5 ~ {Invulnerable:1,ExplosionRadius:127,Fuse:0,ignited:1,CustomName:"a High Energy Fusion Explosion",CustomNameVisible:0,PersistenceRequired:1b}

execute if predicate datapipes_lib:chances/50 positioned ^ ^ ^-1 run return run summon minecraft:creeper ~ ~.5 ~ {Invulnerable:1,ExplosionRadius:127,Fuse:0,ignited:1,CustomName:"an ultra high power electromagnetic detonation",CustomNameVisible:0,PersistenceRequired:1b}
execute positioned ^ ^ ^-1 run summon minecraft:creeper ~ ~-.5 ~ {Invulnerable:1,ExplosionRadius:127,Fuse:0,ignited:1,CustomName:"an ultra high power electromagnetic detonation",CustomNameVisible:0,PersistenceRequired:1b}
