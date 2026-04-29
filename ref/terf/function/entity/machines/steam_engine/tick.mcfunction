#terf_data_A = stored water amount
#terf_data_B = potential power

execute if score @s terf_data_A matches ..1 if block ^-1 ^-1 ^ water_cauldron run function terf:entity/machines/steam_engine/load_water
execute if score @s terf_data_A matches ..0 run return fail

execute if block ^-1 ^-2 ^ furnace[lit=true] run scoreboard players add @s terf_data_B 1
execute if block ^-1 ^-2 ^ blast_furnace[lit=true] run scoreboard players add @s terf_data_B 2
execute if block ^-1 ^-2 ^ smoker[lit=true] run scoreboard players add @s terf_data_B 2

execute if score @s terf_data_B matches 12.. if block ^-1 ^ ^ copper_block run return run function terf:entity/machines/steam_engine/run
execute if score @s terf_data_B matches 24.. if block ^-1 ^ ^ exposed_copper run return run function terf:entity/machines/steam_engine/run
execute if score @s terf_data_B matches 48.. if block ^-1 ^ ^ weathered_copper run return run function terf:entity/machines/steam_engine/run
execute if score @s terf_data_B matches 96.. if block ^-1 ^ ^ oxidized_copper run function terf:entity/machines/steam_engine/run
