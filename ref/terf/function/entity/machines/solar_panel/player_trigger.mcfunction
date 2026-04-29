scoreboard players set @s terf_broke_lapis_block 0
scoreboard players set @s terf_placed_lapis_block 0
execute as @e[type=marker,tag=terf_solar_panel,distance=..512] at @s run function terf:entity/machines/solar_panel/update_start
execute as @e[type=marker,tag=terf_solar_panel,distance=..512] at @s run function terf:entity/machines/solar_panel/update_end