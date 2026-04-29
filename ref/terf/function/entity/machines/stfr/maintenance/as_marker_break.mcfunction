particle minecraft:firework ~ ~ ~ 0.2 0.2 0.2 1 200 force
particle minecraft:large_smoke ~ ~ ~ 0.2 0.2 0.2 0.5 100 force
setblock ~ ~ ~ air destroy

playsound terf:explosion.missile ambient @a[distance=0..] ~ ~ ~ 6 0
playsound terf:explosion.tank_shot ambient @a[distance=0..] ~ ~ ~ 6 0
playsound minecraft:item.mace.smash_ground_heavy ambient @a[distance=0..] ~ ~ ~ 6 0.7
playsound minecraft:item.mace.smash_ground_heavy ambient @a[distance=0..] ~ ~ ~ 6 0.7

kill @s
