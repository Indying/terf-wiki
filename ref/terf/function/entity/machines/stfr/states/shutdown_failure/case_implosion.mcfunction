fill ~4 ~4 ~4 ~-4 ~-4 ~-4 air replace #terf:glass
function terf:entity/machines/stfr/structure_checks with entity @s data.terf
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 0
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 0.6
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 0.7
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 0.8
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 0.9
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 1
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 1.1
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 1.2
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 1.3
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 1.4
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 1.5
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 1.6
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 1.7
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 1.8
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 1.9
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 2
playsound terf:explosion.pressuregigaboom master @a[distance=0..] ~ ~ ~ 10 1
playsound terf:explosion.pressuregigaboom master @a[distance=0..] ~ ~ ~ 10 1

effect give @a[distance=..35] minecraft:blindness 1 0 true
scoreboard players add @a[distance=..80] terf_data_P 100

scoreboard players set terminated terf_states 1000
function terf:entity/machines/stfr/states/shutdown_failure/case_implosion_particles/iterate

function terf:entity/machines/stfr/structure_checks with entity @s data.terf