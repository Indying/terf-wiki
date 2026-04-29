execute positioned ~-3 ~-3 ~-3 run function terf:require/run_spatial/run {x:6,y:6,z:6,command:"execute if block ~ ~ ~ #terf:valid_stfr_case_blocks run function terf:entity/machines/stfr/visuals/shoot_into_falling_block"}

function terf:entity/machines/stfr/structure_checks with entity @s data.terf
particle minecraft:campfire_signal_smoke ~ ~ ~ 0.5 0.5 0.5 1 2000
particle minecraft:campfire_signal_smoke ~ ~ ~ 0.5 0.5 0.5 0.2 1000
particle minecraft:explosion ~ ~ ~ 0 0 0 10 10 force
playsound terf:explosion.pressuregigaboom ambient @a[distance=0..] ~ ~ ~ 10 0
playsound terf:explosion.pressuregigaboom ambient @a[distance=0..] ~ ~ ~ 10 0.6
playsound terf:explosion.pressuregigaboom ambient @a[distance=0..] ~ ~ ~ 10 0.7
playsound terf:explosion.pressuregigaboom ambient @a[distance=0..] ~ ~ ~ 10 0.8
playsound terf:explosion.pressuregigaboom ambient @a[distance=0..] ~ ~ ~ 10 0.9
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 0
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 0.6
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 0.7
execute positioned ~-14 ~-14 ~-14 as @a[dx=27,dy=27,dz=27] run damage @s 15 minecraft:explosion
effect give @a[distance=..35] minecraft:blindness 1 0 true
scoreboard players add @a[distance=..80] terf_data_P 100
