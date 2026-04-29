playsound minecraft:block.anvil.use master @a[distance=0..] ~ ~ ~ 0.1 0
particle minecraft:end_rod ~ ~-1 ~ 0 -0.5 0 1 0 force
particle minecraft:flame ~ ~-6 ~ 0 0.3 0 1 0 force

scoreboard players add fluid_amount terf_states 1
execute store result entity @s data.fluids[0].amount int 1 run scoreboard players get fluid_amount terf_states