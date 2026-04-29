scoreboard players remove @s terf_data_N 1
execute if block ~ ~ ~ water run scoreboard players remove @s terf_data_N 10
execute if block ~ ~ ~ water unless block ~ ~ ~ minecraft:water[level=0] run scoreboard players remove @s terf_data_N 40
execute if score @s terf_data_N matches ..-1 run scoreboard players set @s terf_data_N 0
scoreboard players operation temp terf_states = @s terf_data_N
scoreboard players operation temp terf_states /= 1000 terf_states
execute if score temp terf_states matches 1.. as @s[gamemode=!spectator] run scoreboard players operation @a[distance=..3,gamemode=!spectator] terf_data_A += temp terf_states
