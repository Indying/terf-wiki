#terf_data_A = state | 1=turning on lamps, 0=turning off lamps

execute if score @s datapipes_lib_power_storage matches 1.. run scoreboard players remove @s datapipes_lib_power_storage 1

execute if score NETratetimer terf_states >= NETrate terf_states run tag @s remove terf_lc_structure
execute if score NETratetimer terf_states >= NETrate terf_states if block ^ ^1 ^ minecraft:petrified_oak_slab[type=double] if block ^ ^1 ^1 minecraft:andesite_stairs if block ^ ^ ^1 minecraft:redstone_lamp[lit=true] if block ^1 ^ ^1 minecraft:iron_bars if block ^1 ^ ^ granite_slab[type=double] if block ^1 ^1 ^ waxed_lightning_rod[facing=down] run tag @s add terf_lc_structure

execute if score @s datapipes_lib_power_storage matches 1.. unless score @s[tag=terf_lc_structure] terf_data_A matches 1 run function terf:entity/machines/lamp_controller/lamps_on

execute unless score @s[tag=!terf_lc_structure] terf_data_A matches 0 run function terf:entity/machines/lamp_controller/lamps_off
execute unless score @s datapipes_lib_power_storage matches 1.. unless score @s terf_data_A matches 0 run function terf:entity/machines/lamp_controller/lamps_off

execute if entity @s[tag=!terf_lamp_controller_operation] run return fail
function terf:entity/machines/lamp_controller/as_array_value
execute if data entity @s data.terf.buffer[0] run function terf:entity/machines/lamp_controller/as_array_value
execute if data entity @s data.terf.buffer[0] run function terf:entity/machines/lamp_controller/as_array_value
execute unless data entity @s data.terf.buffer[0] run tag @s remove terf_lamp_controller_operation
