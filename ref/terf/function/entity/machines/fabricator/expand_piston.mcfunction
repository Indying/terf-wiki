execute if block ^-1 ^2 ^ minecraft:piston run setblock ^-1 ^2 ^ minecraft:piston[facing=down,extended=true]
setblock ^-1 ^1 ^ minecraft:piston_head[type=normal,short=false,facing=down]
execute if block ^-1 ^3 ^ minecraft:waxed_lightning_rod[facing=down,powered=false] run setblock ^-1 ^3 ^ minecraft:waxed_lightning_rod[facing=down,powered=true]
playsound minecraft:entity.item.break block @a[distance=0..] ^-1 ^1 ^ 1 0
playsound minecraft:block.anvil.land block @a[distance=0..] ^-1 ^1 ^ 1 2
particle minecraft:block{block_state:piston} ^-1 ^1 ^ 0.2 0 0.2 10 100 force
particle lava ^-1 ^1 ^ 0.2 0 0.2 1 10 force
execute positioned ^-1 ^1 ^ align xyz as @a[dx=0,dy=0,dz=0] run damage @s 5 terf:crush