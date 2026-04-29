execute if score @s terf_data_B matches 1.. run return run scoreboard players remove @s terf_data_B 1

execute if block ~ ~ ~ minecraft:dispenser[triggered=true] run return run execute at @s if block ^ ^ ^-1 waxed_lightning_rod run function terf:entity/machines/multi_piston/push_start
execute at @s if block ^ ^ ^1 waxed_lightning_rod rotated ~ ~180 run function terf:entity/machines/multi_piston/push_start
