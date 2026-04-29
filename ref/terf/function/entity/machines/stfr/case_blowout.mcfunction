execute if predicate datapipes_lib:chances/10 rotated 0 0 run function terf:entity/machines/stfr/case_blowout_rotated
execute if predicate datapipes_lib:chances/10 rotated 90 0 run function terf:entity/machines/stfr/case_blowout_rotated
execute if predicate datapipes_lib:chances/10 rotated 180 0 run function terf:entity/machines/stfr/case_blowout_rotated
execute if predicate datapipes_lib:chances/10 rotated 270 0 run function terf:entity/machines/stfr/case_blowout_rotated
execute if predicate datapipes_lib:chances/10 rotated 0 180 run function terf:entity/machines/stfr/case_blowout_rotated
execute if predicate datapipes_lib:chances/10 rotated 90 180 run function terf:entity/machines/stfr/case_blowout_rotated
execute if predicate datapipes_lib:chances/10 rotated 180 180 run function terf:entity/machines/stfr/case_blowout_rotated
execute if predicate datapipes_lib:chances/10 rotated 270 180 run function terf:entity/machines/stfr/case_blowout_rotated
function terf:entity/machines/stfr/structure_checks with entity @s data.terf
execute if entity @s[tag=terf_case] run return fail

playsound terf:explosion.pressuregigaboom ambient @a[distance=0..] ~ ~ ~ 10 2
playsound terf:explosion.pressuregigaboom ambient @a[distance=0..] ~ ~ ~ 10 1
playsound terf:explosion.pressuregigaboom ambient @a[distance=0..] ~ ~ ~ 10 0
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 0
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 0.6
playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=0..] ~ ~ ~ 8 0.7
particle minecraft:poof ~ ~ ~ 0.5 0.5 0.5 5 3000 force
execute positioned ~-14 ~-14 ~-14 as @a[dx=27,dy=27,dz=27] run damage @s 5 minecraft:explosion
effect give @a[distance=..35] minecraft:blindness 1 0 true
scoreboard players add @a[distance=..80] terf_data_P 100