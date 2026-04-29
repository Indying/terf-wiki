execute unless loaded ~ ~ ~ run return fail

fill ~-1 ~-1 ~-1 ~1 ~1 ~1 air replace water

particle flash{color:[1,1,1,1]} ~ ~ ~ 0 0 0 0 1 force
particle end_rod ~ ~ ~
particle end_rod ^ ^ ^-.2 0 0 0 0 1 force
particle end_rod ^ ^ ^-.4
particle end_rod ^ ^ ^-.6 0 0 0 0 1 force
particle end_rod ^ ^ ^-.8 0 0 0 0 1 force
execute if score length terf_states matches 1000.. run particle campfire_signal_smoke ~ ~ ~ ^ ^ ^100000000 0.000000001 0 force
execute if score length terf_states matches 2000.. run particle explosion ~ ~ ~ 0 0 0 10 1 force

setblock ~ ~ ~ fire keep
execute align xyz as @a[dx=0,dy=0,dz=0] run damage @s 100 terf:hadron_collider

#TO DO: make half slabs rotate by less
execute if block ^1 ^ ^ petrified_oak_slab[type=double] rotated ~5 ~ positioned ^ ^ ^1 run return run function terf:entity/machines/hadron_collider/ring/beam_raycast
execute if block ^-1 ^ ^ petrified_oak_slab[type=double] rotated ~-5 ~ positioned ^ ^ ^1 run return run function terf:entity/machines/hadron_collider/ring/beam_raycast

execute if block ^ ^1 ^ petrified_oak_slab[type=double] rotated ~ ~5 positioned ^ ^ ^1 run return run function terf:entity/machines/hadron_collider/ring/beam_raycast
execute if block ^ ^-1 ^ petrified_oak_slab[type=double] rotated ~ ~-5 positioned ^ ^ ^1 run return run function terf:entity/machines/hadron_collider/ring/beam_raycast

execute if block ~ ~ ~ #terf:air_and_fire positioned ^ ^ ^1 run return run function terf:entity/machines/hadron_collider/ring/beam_raycast
playsound terf:explosion.rocketfly master @a ~ ~ ~ 32 1
playsound terf:explosion.rocketfly master @a ~ ~ ~ 32 1.1
playsound terf:explosion.rocketfly master @a ~ ~ ~ 32 1.2
playsound terf:explosion.rocketfly master @a ~ ~ ~ 32 1.3
playsound terf:explosion.rocketfly master @a ~ ~ ~ 32 1.4
playsound terf:explosion.rocketfly master @a ~ ~ ~ 32 1.5
playsound terf:explosion.rocketfly master @a ~ ~ ~ 32 1.6
playsound terf:explosion.rocketfly master @a ~ ~ ~ 32 1.7
playsound terf:explosion.rocketfly master @a ~ ~ ~ 32 1.8
playsound terf:explosion.rocketfly master @a ~ ~ ~ 32 1.9
playsound terf:explosion.rocketfly master @a ~ ~ ~ 32 2

execute if dimension minecraft:overworld if block ~ ~1 ~ barrier if block ~ ~2 ~ barrier if block ~ ~3 ~ barrier if block ~ ~4 ~ barrier in terf:orbit_earth positioned ~ 1 ~ run return run function terf:entity/machines/hadron_collider/ring/beam_raycast
execute if blocks ~ ~ ~ ~ ~ ~ ~ ~ ~ masked run return run function terf:entity/machines/hadron_collider/ring/explosion

execute if dimension terf:orbit_earth if blocks ~ ~1 ~ ~ ~1 ~ ~ ~1 ~ masked in minecraft:overworld if score current_session_time terfmap_states matches 24000.. if entity @e[tag=terf_stfr,scores={terf_data_A=3..}] positioned ~ 242 ~ if block ~ ~1 ~ barrier unless block ~ ~ ~ barrier run return run function terf:entity/machines/hadron_collider/ring/beam_raycast

execute if dimension terf:orbit_end if blocks ~ ~1 ~ ~ ~1 ~ ~ ~1 ~ masked in minecraft:the_end positioned ~ 319 ~ run return run function terf:entity/machines/hadron_collider/ring/beam_raycast
execute if dimension minecraft:the_end if blocks ~ ~-1 ~ ~ ~-1 ~ ~ ~-1 ~ masked in terf:orbit_end positioned ~ 1 ~ run function terf:entity/machines/hadron_collider/ring/beam_raycast
