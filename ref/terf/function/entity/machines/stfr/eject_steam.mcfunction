execute as @s[tag=terf_stab6] run particle minecraft:poof ~ ~-10.5 ~ 0.7 0 0.7 0 100 force
execute as @s[tag=terf_stab6] run particle minecraft:poof ~ ~-10.5 ~ 0.7 0 0.7 0 100 force

execute as @s[tag=terf_stab5] run particle minecraft:poof ~-9.5 ~ ~ 0 0.7 0.7 0 100 force
execute as @s[tag=terf_stab5] run particle minecraft:poof ~-8.5 ~ ~ 0 0.7 0.7 0 100 force

execute as @s[tag=terf_stab4] run particle minecraft:poof ~ ~ ~-9.5 0.7 0.7 0 0 100 force
execute as @s[tag=terf_stab4] run particle minecraft:poof ~ ~ ~-7.5 0.7 0.7 0 0 100 force

execute as @s[tag=terf_stab3] run particle minecraft:poof ~9.5 ~ ~ 0 0.7 0.7 0 100 force
execute as @s[tag=terf_stab3] run particle minecraft:poof ~7.5 ~ ~ 0 0.7 0.7 0 100 force

execute as @s[tag=terf_stab2] run particle minecraft:poof ~ ~ ~9.5 0.7 0.7 0 0 100 force
execute as @s[tag=terf_stab2] run particle minecraft:poof ~ ~ ~7.5 0.7 0.7 0 0 100 force

execute as @s[tag=terf_stab1] run particle minecraft:poof ~ ~10.5 ~ 0.7 0 0.7 0 100 force
execute as @s[tag=terf_stab1] run particle minecraft:poof ~ ~8.5 ~ 0.7 0 0.7 0 100 force

playsound minecraft:item.mace.smash_ground_heavy ambient @a[distance=0..] ~ ~ ~ 3 0
playsound minecraft:block.fire.extinguish ambient @a[distance=0..] ~ ~ ~ 2 0

function terf:entity/machines/stfr/visuals/stabilizer/rotation/rotate_stabilizers
function terf:entity/machines/stfr/visuals/stabilizer/rotation/rotate_stabilizers
function terf:entity/machines/stfr/visuals/stabilizer/rotation/rotate_stabilizers
function terf:entity/machines/stfr/visuals/stabilizer/rotation/rotate_stabilizers
function terf:entity/machines/stfr/visuals/stabilizer/rotation/rotate_stabilizers

execute unless score @s terf_data_A matches 12 as @s[tag=terf_stab6] rotated 0 90 if predicate datapipes_lib:chances/0.3 positioned ^ ^ ^11 unless block ^ ^ ^4 chiseled_quartz_block unless block ^ ^ ^4 quartz_pillar unless block ^ ^ ^4 polished_basalt unless block ^ ^ ^4 smooth_basalt run function terf:entity/machines/stfr/explode_stabilizer
execute unless score @s terf_data_A matches 12 as @s[tag=terf_stab1] rotated 0 -90 if predicate datapipes_lib:chances/0.3 positioned ^ ^ ^11 unless block ^ ^ ^4 chiseled_quartz_block unless block ^ ^ ^4 quartz_pillar unless block ^ ^ ^4 polished_basalt unless block ^ ^ ^4 smooth_basalt run function terf:entity/machines/stfr/explode_stabilizer

execute unless score @s terf_data_A matches 12 as @s[tag=terf_stab5] rotated 90 0 if predicate datapipes_lib:chances/0.3 positioned ^ ^ ^11 unless block ^ ^ ^4 chiseled_quartz_block unless block ^ ^ ^4 quartz_pillar unless block ^ ^ ^4 polished_basalt unless block ^ ^ ^4 smooth_basalt run function terf:entity/machines/stfr/explode_stabilizer
execute unless score @s terf_data_A matches 12 as @s[tag=terf_stab3] rotated -90 0 if predicate datapipes_lib:chances/0.3 positioned ^ ^ ^11 unless block ^ ^ ^4 chiseled_quartz_block unless block ^ ^ ^4 quartz_pillar unless block ^ ^ ^4 polished_basalt unless block ^ ^ ^4 smooth_basalt run function terf:entity/machines/stfr/explode_stabilizer

execute unless score @s terf_data_A matches 12 as @s[tag=terf_stab4] rotated 0 0 if predicate datapipes_lib:chances/0.3 positioned ^ ^ ^11 unless block ^ ^ ^4 chiseled_quartz_block unless block ^ ^ ^4 quartz_pillar unless block ^ ^ ^4 polished_basalt unless block ^ ^ ^4 smooth_basalt run function terf:entity/machines/stfr/explode_stabilizer
execute unless score @s terf_data_A matches 12 as @s[tag=terf_stab2] rotated 180 0 if predicate datapipes_lib:chances/0.3 positioned ^ ^ ^11 unless block ^ ^ ^4 chiseled_quartz_block unless block ^ ^ ^4 quartz_pillar unless block ^ ^ ^4 polished_basalt unless block ^ ^ ^4 smooth_basalt run function terf:entity/machines/stfr/explode_stabilizer
