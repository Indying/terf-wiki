execute as @e[type=item,distance=0..] if items entity @s container.0 #minecraft:wool run kill @s
execute as @e[type=item,distance=0..] if items entity @s container.0 tnt run kill @s

execute unless block ~ ~2 ~ minecraft:command_block run scoreboard players add minesweeper_reset terf_states 1
execute unless score minesweeper_reset terf_states matches 240.. run return fail
scoreboard players set minesweeper_reset terf_states 0
kill @e[type=tnt,distance=0..]
$execute positioned ~ ~3 ~ run function terf:test/minesweeper/summon_board {size:$(size),difficulty:$(difficulty)}
