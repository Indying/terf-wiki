execute on vehicle on vehicle on vehicle on passengers as @s[type=minecraft:interaction] on passengers run tag @s add terf_currententity
execute if score alternate terf_states matches -1 positioned ^1.65 ^-0.3 ^2.45 run particle minecraft:gust ~ ~ ~ 0 0 0 0 1 force
execute if score alternate terf_states matches 1 positioned ^-1.65 ^-0.3 ^2.45 run particle minecraft:gust ~ ~ ~ 0 0 0 0 1 force

scoreboard players set terminated terf_states 0
execute positioned ^ ^-0.3 ^2.45 run function terf:entity/vehicle/mining_ship/laser_raycast

tag @a remove terf_currententity
playsound minecraft:entity.illusioner.cast_spell ambient @a[distance=0..] ~ ~ ~ 1 2
playsound minecraft:entity.ender_dragon.hurt ambient @a[distance=0..] ~ ~ ~ 1 2
playsound minecraft:entity.wither.shoot ambient @a[distance=0..] ~ ~ ~ 0.2 2