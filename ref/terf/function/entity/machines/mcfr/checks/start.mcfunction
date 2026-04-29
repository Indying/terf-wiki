scoreboard players set height terf_states 0
execute if score @s terf_data_A < @s terf_data_G run return run function terf:entity/machines/mcfr/checks/count

#check bottom vent blocks
execute positioned ~-1 ~-1 ~ unless block ~ ~ ~ green_glazed_terracotta run function terf:entity/machines/mcfr/checks/at_coolant_leak
execute positioned ~-1 ~-1 ~1 unless block ~ ~ ~ green_glazed_terracotta run function terf:entity/machines/mcfr/checks/at_coolant_leak
execute positioned ~2 ~-1 ~ unless block ~ ~ ~ green_glazed_terracotta run function terf:entity/machines/mcfr/checks/at_coolant_leak
execute positioned ~2 ~-1 ~1 unless block ~ ~ ~ green_glazed_terracotta run function terf:entity/machines/mcfr/checks/at_coolant_leak

execute positioned ~ ~-1 ~-1 unless block ~ ~ ~ green_glazed_terracotta run function terf:entity/machines/mcfr/checks/at_coolant_leak
execute positioned ~1 ~-1 ~-1 unless block ~ ~ ~ green_glazed_terracotta run function terf:entity/machines/mcfr/checks/at_coolant_leak
execute positioned ~ ~-1 ~2 unless block ~ ~ ~ green_glazed_terracotta run function terf:entity/machines/mcfr/checks/at_coolant_leak
execute positioned ~1 ~-1 ~2 unless block ~ ~ ~ green_glazed_terracotta run function terf:entity/machines/mcfr/checks/at_coolant_leak

#check bottom netherite
execute positioned ~ ~-1 ~1 unless block ~ ~ ~ obsidian run return run function terf:entity/machines/mcfr/checks/at_leak
execute positioned ~ ~-1 ~1 unless block ~ ~ ~ obsidian run return run function terf:entity/machines/mcfr/checks/at_leak
execute positioned ~1 ~-1 ~ unless block ~ ~ ~ obsidian run return run function terf:entity/machines/mcfr/checks/at_leak
execute positioned ~1 ~-1 ~1 unless block ~ ~ ~ obsidian run return run function terf:entity/machines/mcfr/checks/at_leak
scoreboard players operation height terf_states = @s terf_data_B
function terf:entity/machines/mcfr/checks/at_segments