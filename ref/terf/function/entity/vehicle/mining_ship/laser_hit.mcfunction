execute unless block ~ ~ ~ #terf:indestructible run fill ~ ~ ~ ~ ~ ~ air destroy
summon tnt ~ ~ ~ {fuse:0}

execute store result score temp terf_states run random value 15000..25000
execute as @e[tag=terf_mining_ship,tag=terf_vehicle,distance=..4] run scoreboard players operation @s terf_data_D += temp terf_states

particle minecraft:explosion
playsound minecraft:block.end_gateway.spawn ambient @a[distance=0..] ~ ~ ~ 1 0.7
execute as @e[type=item,distance=..5] run data modify entity @s PickupDelay set value 0s
tp @e[type=item,distance=..7,nbt=!{Item:{id:"minecraft:cobblestone"}},nbt=!{Item:{id:"minecraft:cobbled_deepslate"}},nbt=!{Item:{id:"minecraft:dirt"}},nbt=!{Item:{id:"minecraft:diorite"}},nbt=!{Item:{id:"minecraft:andesite"}},nbt=!{Item:{id:"minecraft:granite"}}] @a[tag=terf_currententity,limit=1]
