$execute align xyz positioned ~.5 ~.5 ~.5 run function terf:require/run_spatial/run {x:$(size),y:0,z:$(size),command:"function terf:test/minesweeper/summon_tile {difficulty:$(difficulty)}"}
fill ~ ~-1 ~ ~1 ~-1 ~1 air
$fill ~ ~-1 ~ ~1 ~-1 ~1 command_block{Command:'function terf:test/minesweeper/break_tile {difficulty:$(difficulty)}'}
