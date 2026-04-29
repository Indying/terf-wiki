scoreboard players add height terf_states 1
execute positioned ~ ~1 ~ if block ~ ~ ~ white_glazed_terracotta run return run function terf:entity/machines/mcfr/checks/count
scoreboard players operation @s terf_data_B = height terf_states
execute store result entity @s data.terf.height int 1 run scoreboard players get height terf_states
scoreboard players add height terf_states 1
execute store result entity @s data.terf.above int 1 run scoreboard players get height terf_states
