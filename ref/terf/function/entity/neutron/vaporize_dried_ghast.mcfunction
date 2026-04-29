#why would you do this to the little guy?
playsound minecraft:entity.ghast.ambient master @a[distance=0..] ~ ~ ~ 4 2
execute unless predicate datapipes_lib:chances/0.1 run return fail

setblock ~ ~ ~ air
summon item ~ ~ ~ {Item:{id:"minecraft:ghast_tear"}}
particle white_ash ~ ~ ~ 0.2 0.2 0.2 1 100 force
particle poof ~ ~ ~ 0.2 0.2 0.2 0.1 100 force

playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 0
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 0.1
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 0.2
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 0.3
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 0.4
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 0.5
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 0.6
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 0.7
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 0.8
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 0.9
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 1
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 1.1
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 1.2
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 1.3
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 1.4
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 1.5
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 1.6
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 1.7
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 1.8
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 1.9
playsound minecraft:block.dried_ghast.break master @a[distance=0..] ~ ~ ~ 4 2
