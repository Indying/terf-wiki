setblock ~ ~1 ~ polished_blackstone_button[face=floor]
setblock ~ ~ ~ polished_blackstone
$execute if predicate datapipes_lib:chances/$(difficulty) run return run setblock ~ ~-1 ~ command_block{Command:'function terf:test/minesweeper/explode',UpdateLastExecution:0b}
$setblock ~ ~-1 ~ command_block{Command:'function terf:test/minesweeper/break_tile {difficulty:$(difficulty)}'}