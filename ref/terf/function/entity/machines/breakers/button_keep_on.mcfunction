execute if block ~ ~ ~ minecraft:stone_button[powered=true,face=ceiling,facing=east] run setblock ~ ~ ~ minecraft:polished_blackstone_button[powered=true,face=ceiling,facing=east]
execute if block ~ ~ ~ minecraft:stone_button[powered=true,face=ceiling,facing=south] run setblock ~ ~ ~ minecraft:polished_blackstone_button[powered=true,face=ceiling,facing=south]
execute if block ~ ~ ~ minecraft:stone_button[powered=true,face=ceiling,facing=west] run setblock ~ ~ ~ minecraft:polished_blackstone_button[powered=true,face=ceiling,facing=west]
execute if block ~ ~ ~ minecraft:stone_button[powered=true,face=ceiling,facing=north] run setblock ~ ~ ~ minecraft:polished_blackstone_button[powered=true,face=ceiling,facing=north]

execute if block ~ ~ ~ minecraft:stone_button[powered=true,face=floor,facing=east] run setblock ~ ~ ~ minecraft:polished_blackstone_button[powered=true,face=floor,facing=east]
execute if block ~ ~ ~ minecraft:stone_button[powered=true,face=floor,facing=south] run setblock ~ ~ ~ minecraft:polished_blackstone_button[powered=true,face=floor,facing=south]
execute if block ~ ~ ~ minecraft:stone_button[powered=true,face=floor,facing=west] run setblock ~ ~ ~ minecraft:polished_blackstone_button[powered=true,face=floor,facing=west]
execute if block ~ ~ ~ minecraft:stone_button[powered=true,face=floor,facing=north] run setblock ~ ~ ~ minecraft:polished_blackstone_button[powered=true,face=floor,facing=north]

execute if block ~ ~ ~ minecraft:stone_button[powered=true,face=wall,facing=east] run setblock ~ ~ ~ minecraft:polished_blackstone_button[powered=true,face=wall,facing=east]
execute if block ~ ~ ~ minecraft:stone_button[powered=true,face=wall,facing=south] run setblock ~ ~ ~ minecraft:polished_blackstone_button[powered=true,face=wall,facing=south]
execute if block ~ ~ ~ minecraft:stone_button[powered=true,face=wall,facing=west] run setblock ~ ~ ~ minecraft:polished_blackstone_button[powered=true,face=wall,facing=west]
execute if block ~ ~ ~ minecraft:stone_button[powered=true,face=wall,facing=north] run setblock ~ ~ ~ minecraft:polished_blackstone_button[powered=true,face=wall,facing=north]

playsound terf:spotlight2 master @a[distance=0..] ~ ~ ~ 1 1.5

tag @s add terf_breaker_started