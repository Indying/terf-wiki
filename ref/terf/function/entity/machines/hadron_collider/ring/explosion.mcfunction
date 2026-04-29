particle minecraft:firework ~ ~ ~ 1 1 1 1 2000 force
particle minecraft:lava ~ ~ ~ .5 .5 .5 1 100 force

scoreboard players add length terf_states 20
execute if score length terf_states matches 2541.. run scoreboard players set length terf_states 2540

execute if score disable_block_damage terf_states matches 0 if score length terf_states matches 2000.. positioned ^ ^ ^-1 run summon minecraft:creeper ~1 ~ ~ {Tags:["terf_hadron_explosion","terf_currententity"],ignited:1b,Fuse:7,CustomName:"a stray hadron collider beam explosion",PersistenceRequired:1b,Invulnerable:1b}
execute if score disable_block_damage terf_states matches 0 if score length terf_states matches 1667.. positioned ^ ^ ^-1 run summon minecraft:creeper ~-1 ~ ~ {Tags:["terf_hadron_explosion","terf_currententity"],ignited:1b,Fuse:6,CustomName:"a stray hadron collider beam explosion",PersistenceRequired:1b,Invulnerable:1b}
execute if score disable_block_damage terf_states matches 0 if score length terf_states matches 1334.. positioned ^ ^ ^-1 run summon minecraft:creeper ~ ~1 ~ {Tags:["terf_hadron_explosion","terf_currententity"],ignited:1b,Fuse:5,CustomName:"a stray hadron collider beam explosion",PersistenceRequired:1b,Invulnerable:1b}
execute if score disable_block_damage terf_states matches 0 if score length terf_states matches 1000.. positioned ^ ^ ^-1 run summon minecraft:creeper ~ ~-1 ~ {Tags:["terf_hadron_explosion","terf_currententity"],ignited:1b,Fuse:4,CustomName:"a stray hadron collider beam explosion",PersistenceRequired:1b,Invulnerable:1b}
execute if score disable_block_damage terf_states matches 0 if score length terf_states matches 668.. positioned ^ ^ ^-1 run summon minecraft:creeper ~ ~ ~1 {Tags:["terf_hadron_explosion","terf_currententity"],ignited:1b,Fuse:3,CustomName:"a stray hadron collider beam explosion",PersistenceRequired:1b,Invulnerable:1b}
execute if score disable_block_damage terf_states matches 0 if score length terf_states matches 335.. positioned ^ ^ ^-1 run summon minecraft:creeper ~ ~ ~-1 {Tags:["terf_hadron_explosion","terf_currententity"],ignited:1b,Fuse:2,CustomName:"a stray hadron collider beam explosion",PersistenceRequired:1b,Invulnerable:1b}
execute if score disable_block_damage terf_states matches 0 positioned ^ ^ ^-1 run summon minecraft:creeper ~ ~ ~ {Tags:["terf_hadron_explosion","terf_currententity"],ignited:1b,Fuse:1,CustomName:"a stray hadron collider beam explosion",PersistenceRequired:1b,Invulnerable:1b}

execute as @e[type=creeper,tag=terf_currententity] store result entity @s ExplosionRadius int 0.05 run scoreboard players get length terf_states
tag @e[type=creeper] remove terf_currententity
kill @e[tag=terf_particle,distance=..256]
execute if score length terf_states matches 400.. run function terf:entity/explosion/small_explosion/summon
execute if score length terf_states matches 1000.. run function terf:entity/explosion/large_explosion/summon

scoreboard players add @a[distance=..10] terf_data_A 1100000
scoreboard players set @a[distance=..96] terf_data_P 40
execute as @a[distance=..20] at @s run rotate @s ~ ~-30

playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 1 1
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 1.5 0.9
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 2 0.8
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 2.5 0.7
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 3 0.6
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 3.5 0.5
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 4 0.4
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 4.5 0.3
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 5 0.2
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 5.5 0.1
playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 6 0

tag @s add terf_hadronfailed
function terf:entity/machines/hadron_collider/stop