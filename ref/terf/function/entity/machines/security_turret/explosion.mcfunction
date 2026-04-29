particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 1 2 force
particle minecraft:firework ~ ~ ~ 1 1 1 1 2000 force
particle minecraft:large_smoke ~ ~ ~ 0 0 0 1 300 force

execute as @a[distance=..6] run damage @s 69 minecraft:explosion
execute as @a[distance=..6] run advancement grant @s only terf:break_turret

execute as @a[distance=..20] at @s run rotate @s ~ ~-30

playsound minecraft:block.glass.break ambient @a[distance=0..] ~ ~ ~ 1 0
playsound minecraft:block.glass.break ambient @a[distance=0..] ~ ~ ~ 1 0
playsound minecraft:block.glass.break ambient @a[distance=0..] ~ ~ ~ 1 0

playsound minecraft:item.mace.smash_ground_heavy ambient @a[distance=0..] ~ ~ ~ 3 0.5
playsound minecraft:item.mace.smash_ground_heavy ambient @a[distance=0..] ~ ~ ~ 3 0.55
playsound minecraft:item.mace.smash_ground_heavy ambient @a[distance=0..] ~ ~ ~ 3 0.6
playsound minecraft:item.mace.smash_ground_heavy ambient @a[distance=0..] ~ ~ ~ 3 0.65
