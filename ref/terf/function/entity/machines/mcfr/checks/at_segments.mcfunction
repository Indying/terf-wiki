execute unless block ~ ~ ~ white_glazed_terracotta[facing=north] run return run function terf:entity/machines/mcfr/checks/at_leak
execute positioned ~ ~ ~1 unless block ~ ~ ~ white_glazed_terracotta[facing=west] run return run function terf:entity/machines/mcfr/checks/at_leak
execute positioned ~1 ~ ~ unless block ~ ~ ~ white_glazed_terracotta[facing=east] run return run function terf:entity/machines/mcfr/checks/at_leak
execute positioned ~1 ~ ~1 unless block ~ ~ ~ white_glazed_terracotta[facing=south] run return run function terf:entity/machines/mcfr/checks/at_leak

scoreboard players remove height terf_states 1
execute if score height terf_states matches 1.. positioned ~ ~1 ~ run return run function terf:entity/machines/mcfr/checks/at_segments

#check top vent blocks
execute positioned ~-1 ~1 ~ unless block ~ ~ ~ green_glazed_terracotta run function terf:entity/machines/mcfr/checks/at_coolant_leak
execute positioned ~-1 ~1 ~1 unless block ~ ~ ~ green_glazed_terracotta run function terf:entity/machines/mcfr/checks/at_coolant_leak
execute positioned ~2 ~1 ~ unless block ~ ~ ~ green_glazed_terracotta run function terf:entity/machines/mcfr/checks/at_coolant_leak
execute positioned ~2 ~1 ~1 unless block ~ ~ ~ green_glazed_terracotta run function terf:entity/machines/mcfr/checks/at_coolant_leak

execute positioned ~ ~1 ~-1 unless block ~ ~ ~ green_glazed_terracotta run function terf:entity/machines/mcfr/checks/at_coolant_leak
execute positioned ~1 ~1 ~-1 unless block ~ ~ ~ green_glazed_terracotta run function terf:entity/machines/mcfr/checks/at_coolant_leak
execute positioned ~ ~1 ~2 unless block ~ ~ ~ green_glazed_terracotta run function terf:entity/machines/mcfr/checks/at_coolant_leak
execute positioned ~1 ~1 ~2 unless block ~ ~ ~ green_glazed_terracotta run function terf:entity/machines/mcfr/checks/at_coolant_leak

#check top netherite
execute positioned ~ ~1 ~ unless block ~ ~ ~ obsidian run return run function terf:entity/machines/mcfr/checks/at_leak
execute positioned ~ ~1 ~1 unless block ~ ~ ~ obsidian run return run function terf:entity/machines/mcfr/checks/at_leak
execute positioned ~1 ~1 ~ unless block ~ ~ ~ obsidian run return run function terf:entity/machines/mcfr/checks/at_leak
execute positioned ~1 ~1 ~1 unless block ~ ~ ~ obsidian run return run function terf:entity/machines/mcfr/checks/at_leak
