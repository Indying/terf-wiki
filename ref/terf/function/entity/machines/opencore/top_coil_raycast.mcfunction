scoreboard players add temp terf_states 1
execute unless block ~ ~ ~ minecraft:iron_block if score temp terf_states matches ..16 positioned ~ ~1 ~ run function terf:entity/machines/opencore/top_coil_raycast
execute if block ~ ~ ~ minecraft:iron_block run function terf:entity/machines/opencore/top_coil_checks