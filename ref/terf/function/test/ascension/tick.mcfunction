execute as @e[type=block_display,tag=terf_ascension] at @s run function terf:test/ascension/as_block_displays
execute if score oldmapadditions_installed terfmap_states matches 1 run return run function terf:require/run_n_times {n:50,command:'function terf_oldmapadditions:at_random_map_block {y:"80..120",command:"function terf:test/ascension/at_block"}'}

data modify storage terf:temp args set value {command:"execute positioned over world_surface positioned ~ ~-.1 ~ run function terf:test/ascension/at_block",y:0}
function terf:require/run_n_times {n:50,command:'execute as @r[distance=..1000000] at @s run function terf:test/ascension/random'}
