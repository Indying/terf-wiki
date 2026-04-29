execute if block ~ ~ ~ #terf:indestructible run return fail
execute if block ~ ~ ~ air run setblock ~ ~ ~ fire
execute if block ~ ~ ~ water run scoreboard players remove @s terf_data_P 26000
execute if block ~ ~ ~ water run playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 1 0.7
execute if block ~ ~ ~ water run particle minecraft:poof ~ ~.2 ~ 0.2 0.1 0.2 0 20 force
execute if block ~ ~ ~ water if predicate datapipes_lib:chances/20 run setblock ~ ~ ~ minecraft:glow_lichen[down=true]
execute if block ~ ~ ~ water run setblock ~ ~ ~ air
