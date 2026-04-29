$data modify storage terf:temp args set value {x:$(x),y:$(y),z:$(z)}
$execute positioned $(x) $(y) $(z) run function terf:test/black_hole/at_attractor
execute as @e[type=minecraft:block_display] at @s run function terf:test/black_hole/block_display_tick with storage terf:temp args
