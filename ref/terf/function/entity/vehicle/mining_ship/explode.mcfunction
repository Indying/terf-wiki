data modify storage terf:temp args set value {arg1:"kill @e[tag=terf_related_",arg3:"]"}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get @s terf_scorelink
function datapipes_lib:require/with_args/3 with storage terf:temp args

particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 1 10 force
particle minecraft:flame ~ ~ ~ 0 0 0 2 1000 force
particle minecraft:campfire_signal_smoke ~ ~ ~ 0 0 0 1 1000 force
particle minecraft:campfire_signal_smoke ~ ~ ~ 0 0 0 0.2 2000 force
particle minecraft:large_smoke ~ ~ ~ 0 0 0 1 1000 force
particle minecraft:campfire_cosy_smoke ~ ~ ~ 2 2 2 0 100

summon minecraft:creeper ~ ~ ~ {CustomName:"a vehicle crash",CustomNameVisible:0,Silent:1,Invulnerable:1,ExplosionRadius:10,Fuse:0,ignited:1}

playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 2
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 1.9
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 1.8
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 1.7
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 1.6
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 1.5
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 1.4
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 1.3
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 1.2
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 1.1
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 1
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 0.9
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 0.8
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 0.7
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 0.6
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 0.5
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 0.4
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 0.3
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 0.2
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 0.1
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 4 0

playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 2
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 1.9
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 1.8
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 1.7
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 1.6
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 1.5
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 1.4
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 1.3
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 1.2
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 1.1
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 1
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 0.9
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 0.8
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 0.7
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 0.6
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 0.5
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 0.4
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 0.3
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 0.2
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 0.1
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 4 0











