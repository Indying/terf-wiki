scoreboard players add @s terf_data_A 1

execute unless score @s terf_data_A matches 200.. run return fail
execute if score @s terf_data_A matches 200 positioned ^ ^1 ^ run function terf:entity/machines/large_fluid_solidifier/complete with entity @s data.terf
execute if score @s terf_data_A matches 210 positioned ^ ^4 ^1 run function terf:entity/machines/lamp_controller/turn_off_lever
execute if score @s terf_data_A matches 220 run fill ^ ^2 ^-1 ^ ^2 ^-1 minecraft:redstone_block replace minecraft:pink_glazed_terracotta
execute if score @s terf_data_A matches 225 run fill ^ ^2 ^-1 ^ ^2 ^-1 minecraft:pink_glazed_terracotta replace minecraft:redstone_block
execute unless score @s terf_data_A matches 240.. run return fail 
scoreboard players set @s terf_data_A 0
function terf:entity/machines/large_fluid_solidifier/checks