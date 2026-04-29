function terf:entity/meteor/kill

playsound terf:explosion.crash ambient @a[distance=0..] ~ ~ ~ 10 1

scoreboard players set succeeded terf_states 0
execute in terf:intermediary_technical_storage_dimension positioned -29999999 0 -29999999 run forceload add ~ ~ ~5 ~5
execute store result score succeeded terf_states positioned ^ ^ ^1 run clone ~2 ~2 ~2 ~-2 ~-2 ~-2 to terf:intermediary_technical_storage_dimension -29999999 0 -29999999 filtered #terf:meteor_reinforcement
execute in terf:intermediary_technical_storage_dimension positioned -29999999 0 -29999999 run forceload remove ~ ~ ~5 ~5

execute if score succeeded terf_states matches 0 as @s[tag=terf_space_debris] run summon creeper ~ ~ ~ {Invulnerable:1b,ExplosionRadius:1b,PersistenceRequired:1b,Fuse:0,CustomName:"space debris"}
execute as @s[tag=terf_meteor_small] run summon creeper ~ ~ ~ {Invulnerable:1b,ExplosionRadius:4b,PersistenceRequired:1b,Fuse:0,CustomName:"a small meteor"}
#execute as @s[tag=terf_meteor_large] positioned ^ ^ ^1 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace obsidian
execute as @s[tag=terf_meteor_large] run summon creeper ~ ~ ~ {Invulnerable:1b,ExplosionRadius:20b,PersistenceRequired:1b,Fuse:0,CustomName:"a large meteor"}

execute as @s[tag=!terf_space_debris] if block ^ ^ ^1 obsidian run setblock ^ ^ ^1 air
execute as @s[tag=!terf_space_debris] if score succeeded terf_states matches 0 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace #minecraft:replaceable

particle minecraft:campfire_signal_smoke ~ ~ ~ 0.3 0.3 0.3 0.1 10 force

execute as @s[tag=terf_space_debris] run return run particle minecraft:white_ash ~ ~ ~ 0.3 0.3 0.3 10 1000 force
function terf:entity/explosion/small_explosion/summon
playsound minecraft:entity.lightning_bolt.thunder ambient @a[distance=0..] ~ ~ ~ 10 0
playsound minecraft:entity.lightning_bolt.thunder ambient @a[distance=0..] ~ ~ ~ 10 0
playsound minecraft:entity.lightning_bolt.thunder ambient @a[distance=0..] ~ ~ ~ 10 0
playsound minecraft:entity.lightning_bolt.thunder ambient @a[distance=0..] ~ ~ ~ 10 0
stopsound @a[distance=..2024] * terf:rumbling
playsound terf:explosion.explosion_rumble ambient @a[distance=0..] ~ ~ ~ 10 1

