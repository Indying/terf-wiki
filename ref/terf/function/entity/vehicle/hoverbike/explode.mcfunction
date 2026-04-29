execute on passengers run damage @s 10000 minecraft:explosion
execute on passengers run kill @s[type=item_display]
kill @s
function terf:entity/explosion/small_explosion/summon

playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 1
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 0.9
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 0.8
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 0.7
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 0.6
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 0.5
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 0.4
summon minecraft:creeper ~ ~ ~ {CustomName:"a vehicle crash",PersistenceRequired:1b,CustomNameVisible:0,Silent:1,Invulnerable:1,ExplosionRadius:5,Fuse:0,ignited:1}

scoreboard players set terminated terf_states 20
execute at @s rotated ~ ~180 run function terf:entity/vehicle/art/beam/random_particle