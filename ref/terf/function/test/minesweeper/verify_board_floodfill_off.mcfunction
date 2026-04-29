setblock ~ ~-1 ~ air

execute positioned ~1 ~ ~ if block ~ ~ ~ command_block if block ~ ~-1 ~ bedrock run function terf:test/minesweeper/verify_board_floodfill_off
execute positioned ~-1 ~ ~ if block ~ ~ ~ command_block if block ~ ~-1 ~ bedrock run function terf:test/minesweeper/verify_board_floodfill_off
execute positioned ~ ~ ~1 if block ~ ~ ~ command_block if block ~ ~-1 ~ bedrock run function terf:test/minesweeper/verify_board_floodfill_off
execute positioned ~ ~ ~-1 if block ~ ~ ~ command_block if block ~ ~-1 ~ bedrock run function terf:test/minesweeper/verify_board_floodfill_off
