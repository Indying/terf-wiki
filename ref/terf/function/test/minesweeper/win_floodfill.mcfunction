setblock ~ ~2 ~ air
execute if data block ~ ~ ~ {UpdateLastExecution:0b} run setblock ~ ~1 ~ crying_obsidian
$execute if data block ~ ~ ~ {UpdateLastExecution:0b} if predicate datapipes_lib:chances/$(difficulty) run summon item ~ ~2 ~ {Item:{id:"minecraft:netherite_ingot"}}
setblock ~ ~ ~ bedrock
$execute positioned ~1 ~ ~ if block ~ ~ ~ command_block run function terf:test/minesweeper/win_floodfill {difficulty:$(difficulty)}
$execute positioned ~-1 ~ ~ if block ~ ~ ~ command_block run function terf:test/minesweeper/win_floodfill {difficulty:$(difficulty)}
$execute positioned ~ ~ ~1 if block ~ ~ ~ command_block run function terf:test/minesweeper/win_floodfill {difficulty:$(difficulty)}
$execute positioned ~ ~ ~-1 if block ~ ~ ~ command_block run function terf:test/minesweeper/win_floodfill {difficulty:$(difficulty)}
