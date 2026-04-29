data modify entity @s data.terf.multiblock_function set value 'if block ^ ^1 ^1 waxed_lightning_rod if block ^ ^ ^1 granite_slab[type=top] if block ^ ^2 ^1 iron_trapdoor[half=bottom] if block ^ ^2 ^2 iron_trapdoor[half=bottom] if block ^ ^1 ^2 #terf:glass if block ^ ^ ^2 granite_wall run return run function terf:entity/machines/laser/tick'

data modify entity @s data.power set value {checks:'if block ~ ~ ~ red_glazed_terracotta'}
