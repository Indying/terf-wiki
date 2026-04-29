setblock ~ ~-1 ~ bedrock
execute if data block ~ ~ ~ {UpdateLastExecution:1b} unless block ~ ~1 ~ #minecraft:wool run return run scoreboard players set succeeded terf_states 1
execute if data block ~ ~ ~ {UpdateLastExecution:0b} unless block ~ ~1 ~ polished_blackstone run return run scoreboard players set succeeded terf_states 1

execute positioned ~1 ~ ~ if block ~ ~ ~ command_block unless block ~ ~-1 ~ bedrock if score succeeded terf_states matches 0 run function terf:test/minesweeper/verify_board_floodfill_on
execute positioned ~-1 ~ ~ if block ~ ~ ~ command_block unless block ~ ~-1 ~ bedrock if score succeeded terf_states matches 0 run function terf:test/minesweeper/verify_board_floodfill_on
execute positioned ~ ~ ~1 if block ~ ~ ~ command_block unless block ~ ~-1 ~ bedrock if score succeeded terf_states matches 0 run function terf:test/minesweeper/verify_board_floodfill_on
execute positioned ~ ~ ~-1 if block ~ ~ ~ command_block unless block ~ ~-1 ~ bedrock if score succeeded terf_states matches 0 run function terf:test/minesweeper/verify_board_floodfill_on
