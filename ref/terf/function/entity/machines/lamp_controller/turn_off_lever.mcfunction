execute if block ~ ~ ~ lever[powered=true,face=floor,facing=east] run setblock ~ ~ ~ lever[powered=false,face=floor,facing=east]
execute if block ~ ~ ~ lever[powered=true,face=floor,facing=north] run setblock ~ ~ ~ lever[powered=false,face=floor,facing=north]
execute if block ~ ~ ~ lever[powered=true,face=floor,facing=west] run setblock ~ ~ ~ lever[powered=false,face=floor,facing=west]
execute if block ~ ~ ~ lever[powered=true,face=floor,facing=south] run setblock ~ ~ ~ lever[powered=false,face=floor,facing=south]

execute if block ~ ~ ~ lever[powered=true,face=ceiling,facing=east] run setblock ~ ~ ~ lever[powered=false,face=ceiling,facing=east]
execute if block ~ ~ ~ lever[powered=true,face=ceiling,facing=north] run setblock ~ ~ ~ lever[powered=false,face=ceiling,facing=north]
execute if block ~ ~ ~ lever[powered=true,face=ceiling,facing=west] run setblock ~ ~ ~ lever[powered=false,face=ceiling,facing=west]
execute if block ~ ~ ~ lever[powered=true,face=ceiling,facing=south] run setblock ~ ~ ~ lever[powered=false,face=ceiling,facing=south]

execute if block ~ ~ ~ lever[powered=true,face=wall,facing=east] run setblock ~ ~ ~ lever[powered=false,face=wall,facing=east]
execute if block ~ ~ ~ lever[powered=true,face=wall,facing=north] run setblock ~ ~ ~ lever[powered=false,face=wall,facing=north]
execute if block ~ ~ ~ lever[powered=true,face=wall,facing=west] run setblock ~ ~ ~ lever[powered=false,face=wall,facing=west]
execute if block ~ ~ ~ lever[powered=true,face=wall,facing=south] run setblock ~ ~ ~ lever[powered=false,face=wall,facing=south]

playsound terf:lightsswitch master @a[distance=0..] ~ ~ ~ 1 0.7

execute if block ~1 ~ ~1 minecraft:redstone_lamp[lit=true] run setblock ~1 ~ ~1 minecraft:redstone_lamp[lit=false]
execute if block ~-1 ~ ~1 minecraft:redstone_lamp[lit=true] run setblock ~-1 ~ ~1 minecraft:redstone_lamp[lit=false]
execute if block ~1 ~ ~-1 minecraft:redstone_lamp[lit=true] run setblock ~1 ~ ~-1 minecraft:redstone_lamp[lit=false]
execute if block ~-1 ~ ~-1 minecraft:redstone_lamp[lit=true] run setblock ~-1 ~ ~-1 minecraft:redstone_lamp[lit=false]

execute if block ~1 ~1 ~ minecraft:redstone_lamp[lit=true] run setblock ~1 ~1 ~ minecraft:redstone_lamp[lit=false]
execute if block ~-1 ~1 ~ minecraft:redstone_lamp[lit=true] run setblock ~-1 ~1 ~ minecraft:redstone_lamp[lit=false]
execute if block ~1 ~-1 ~ minecraft:redstone_lamp[lit=true] run setblock ~1 ~-1 ~ minecraft:redstone_lamp[lit=false]
execute if block ~-1 ~-1 ~ minecraft:redstone_lamp[lit=true] run setblock ~-1 ~-1 ~ minecraft:redstone_lamp[lit=false]

execute if block ~ ~1 ~1 minecraft:redstone_lamp[lit=true] run setblock ~ ~1 ~1 minecraft:redstone_lamp[lit=false]
execute if block ~ ~-1 ~1 minecraft:redstone_lamp[lit=true] run setblock ~ ~-1 ~1 minecraft:redstone_lamp[lit=false]
execute if block ~ ~1 ~-1 minecraft:redstone_lamp[lit=true] run setblock ~ ~1 ~-1 minecraft:redstone_lamp[lit=false]
execute if block ~ ~-1 ~-1 minecraft:redstone_lamp[lit=true] run setblock ~ ~-1 ~-1 minecraft:redstone_lamp[lit=false]

execute if block ~2 ~ ~ minecraft:redstone_lamp[lit=true] run setblock ~2 ~ ~ minecraft:redstone_lamp[lit=false]
execute if block ~-2 ~ ~ minecraft:redstone_lamp[lit=true] run setblock ~-2 ~ ~ minecraft:redstone_lamp[lit=false]
execute if block ~ ~2 ~ minecraft:redstone_lamp[lit=true] run setblock ~ ~2 ~ minecraft:redstone_lamp[lit=false]
execute if block ~ ~-2 ~ minecraft:redstone_lamp[lit=true] run setblock ~ ~-2 ~ minecraft:redstone_lamp[lit=false]
execute if block ~ ~ ~2 minecraft:redstone_lamp[lit=true] run setblock ~ ~ ~2 minecraft:redstone_lamp[lit=false]
execute if block ~ ~ ~-2 minecraft:redstone_lamp[lit=true] run setblock ~ ~ ~-2 minecraft:redstone_lamp[lit=false]
