scoreboard players set temp terf_states 0
execute if block ~14 ~ ~ red_glazed_terracotta run scoreboard players set temp terf_states 1
execute if block ~-14 ~ ~ red_glazed_terracotta run scoreboard players set temp terf_states 1
execute if block ~ ~14 ~ red_glazed_terracotta run scoreboard players set temp terf_states 1
execute if block ~ ~-14 ~ red_glazed_terracotta run scoreboard players set temp terf_states 1
execute if block ~ ~ ~14 red_glazed_terracotta run scoreboard players set temp terf_states 1
execute if block ~ ~ ~-14 red_glazed_terracotta run scoreboard players set temp terf_states 1

execute if score temp terf_states matches 1 run function terf:entity/machines/mainframe/add_id