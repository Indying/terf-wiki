$function terf:test/minesweeper/break_tile_logic {difficulty:$(difficulty)}
scoreboard players set succeeded terf_states 0
function terf:test/minesweeper/verify_board_floodfill_on
function terf:test/minesweeper/verify_board_floodfill_off
execute if score succeeded terf_states matches 0 run tellraw @a ["",{"text":"["},{"text":"S","color":"red"},{"text":"Y","color":"gold"},{"text":"S","color":"yellow"},{"text":"T","color":"green"},{"text":"E","color":"aqua"},{"text":"M","color":"green"},{"text":"] The board is solved."}]

$execute if score succeeded terf_states matches 0 run function terf:test/minesweeper/win_floodfill {difficulty:$(difficulty)}
