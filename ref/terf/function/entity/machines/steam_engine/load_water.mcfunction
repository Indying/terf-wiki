advancement grant @a[distance=..5] only terf:steam_engine

#explode if there was no water for long and the furnace is lit
execute if score @s terf_data_A matches ..0 if block ^-1 ^-2 ^ furnace[lit=true] run function terf:entity/machines/steam_engine/explode
execute if score @s terf_data_A matches ..0 if block ^-1 ^-2 ^ blast_furnace[lit=true] run function terf:entity/machines/steam_engine/explode
execute if score @s terf_data_A matches ..0 if block ^-1 ^-2 ^ smoker[lit=true] run function terf:entity/machines/steam_engine/explode

#add to water amount
scoreboard players set @s terf_data_A 150
execute if block ^-1 ^-1 ^ water_cauldron[level=3] run return run setblock ^-1 ^-1 ^ water_cauldron[level=2]
execute if block ^-1 ^-1 ^ water_cauldron[level=2] run return run setblock ^-1 ^-1 ^ water_cauldron[level=1]
execute if block ^-1 ^-1 ^ water_cauldron[level=1] run setblock ^-1 ^-1 ^ cauldron
