#1 durability = 100 mwt

execute unless data block ~ ~ ~ Items[] run return run scoreboard players set @s datapipes_lib_power_max 0

scoreboard players set power_usage terf_states 0
execute if data block ~ ~ ~ Items[{Slot:0b}].components.minecraft:custom_data.rechargable run function terf:entity/machines/charging_station/charge_item {slot:0}
execute if data block ~ ~ ~ Items[{Slot:1b}].components.minecraft:custom_data.rechargable run function terf:entity/machines/charging_station/charge_item {slot:1}
execute if data block ~ ~ ~ Items[{Slot:2b}].components.minecraft:custom_data.rechargable run function terf:entity/machines/charging_station/charge_item {slot:2}
execute if data block ~ ~ ~ Items[{Slot:3b}].components.minecraft:custom_data.rechargable run function terf:entity/machines/charging_station/charge_item {slot:3}
execute if data block ~ ~ ~ Items[{Slot:4b}].components.minecraft:custom_data.rechargable run function terf:entity/machines/charging_station/charge_item {slot:4}
execute if data block ~ ~ ~ Items[{Slot:5b}].components.minecraft:custom_data.rechargable run function terf:entity/machines/charging_station/charge_item {slot:5}
execute if data block ~ ~ ~ Items[{Slot:6b}].components.minecraft:custom_data.rechargable run function terf:entity/machines/charging_station/charge_item {slot:6}
execute if data block ~ ~ ~ Items[{Slot:7b}].components.minecraft:custom_data.rechargable run function terf:entity/machines/charging_station/charge_item {slot:7}
execute if data block ~ ~ ~ Items[{Slot:8b}].components.minecraft:custom_data.rechargable run function terf:entity/machines/charging_station/charge_item {slot:8}
execute if score @s datapipes_lib_power_storage >= power_usage terf_states run scoreboard players operation @s datapipes_lib_power_storage -= power_usage terf_states

scoreboard players operation @s datapipes_lib_power_max = power_usage terf_states
scoreboard players operation @s datapipes_lib_power_max *= 100 terf_states