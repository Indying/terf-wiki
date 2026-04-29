playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ 10 1
playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ 10 1

particle minecraft:lava ~ ~ ~ 1 1 1 1 100 force
particle minecraft:explosion ~ ~ ~ 0 0 0 5 10 force
execute if block ~ ~ ~ minecraft:netherite_block run setblock ~ ~ ~ air destroy
summon tnt ~ ~ ~ {fuse:0}
