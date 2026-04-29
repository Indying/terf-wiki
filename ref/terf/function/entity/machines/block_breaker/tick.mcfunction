execute if block ~ ~ ~ #terf:air_and_water run return run scoreboard players set @s terf_data_A 0
scoreboard players add @s terf_data_A 1
execute if score @s terf_data_A matches 20.. run function terf:entity/machines/block_breaker/break

scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players operation temp terf_states %= 4 terf_states
execute if score temp terf_states matches 1 run playsound minecraft:block.heavy_core.hit master @a[distance=0..] ~ ~ ~ 0.5 0