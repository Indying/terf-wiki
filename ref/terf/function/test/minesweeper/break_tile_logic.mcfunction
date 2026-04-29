setblock ~ ~2 ~ air
setblock ~ ~1 ~ white_wool

scoreboard players set bombs terf_states 0
execute if data block ~1 ~ ~ {UpdateLastExecution:0b} run scoreboard players add bombs terf_states 1
execute if data block ~-1 ~ ~ {UpdateLastExecution:0b} run scoreboard players add bombs terf_states 1
execute if data block ~ ~ ~1 {UpdateLastExecution:0b} run scoreboard players add bombs terf_states 1
execute if data block ~ ~ ~-1 {UpdateLastExecution:0b} run scoreboard players add bombs terf_states 1
execute if data block ~1 ~ ~1 {UpdateLastExecution:0b} run scoreboard players add bombs terf_states 1
execute if data block ~-1 ~ ~1 {UpdateLastExecution:0b} run scoreboard players add bombs terf_states 1
execute if data block ~1 ~ ~-1 {UpdateLastExecution:0b} run scoreboard players add bombs terf_states 1
execute if data block ~-1 ~ ~-1 {UpdateLastExecution:0b} run scoreboard players add bombs terf_states 1

$execute if score bombs terf_states matches 0 run return run function terf:test/minesweeper/floodfill {difficulty:$(difficulty)}
execute if score bombs terf_states matches 1 run return run setblock ~ ~1 ~ cyan_wool
execute if score bombs terf_states matches 2 run return run setblock ~ ~1 ~ green_wool
execute if score bombs terf_states matches 3 run return run setblock ~ ~1 ~ orange_wool
execute if score bombs terf_states matches 4 run return run setblock ~ ~1 ~ blue_wool
execute if score bombs terf_states matches 5 run return run setblock ~ ~1 ~ red_wool
execute if score bombs terf_states matches 6 run return run setblock ~ ~1 ~ light_blue_wool
execute if score bombs terf_states matches 7 run return run setblock ~ ~1 ~ purple_wool
execute if score bombs terf_states matches 8 run return run setblock ~ ~1 ~ light_gray_wool
