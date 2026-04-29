scoreboard players set succeeded terf_states 0
execute if block ~ ~ ~-14 red_glazed_terracotta run scoreboard players set succeeded terf_states 1
execute if block ~ ~ ~14 red_glazed_terracotta run scoreboard players set succeeded terf_states 1
execute if block ~ ~-14 ~ red_glazed_terracotta run scoreboard players set succeeded terf_states 1
execute if block ~ ~14 ~ red_glazed_terracotta run scoreboard players set succeeded terf_states 1
execute if block ~-14 ~ ~ red_glazed_terracotta run scoreboard players set succeeded terf_states 1
execute if block ~14 ~ ~ red_glazed_terracotta run scoreboard players set succeeded terf_states 1
execute if score succeeded terf_states matches 0 run return fail
#if connected:

scoreboard players add breaker_usage terf_states 24
tag @s remove terf_breaker_interested

execute if score breaker_activated terf_states matches 0 run return fail

tag @s add terf_breakers_connected
