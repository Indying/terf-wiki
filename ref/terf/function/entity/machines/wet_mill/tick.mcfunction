execute if score NETratetimer terf_states >= NETrate terf_states run tag @s remove terf_wet_mill_case
execute if score NETratetimer terf_states >= NETrate terf_states if block ^ ^1 ^ hopper[enabled=true] if block ^1 ^1 ^ anvil if block ^-1 ^1 ^ anvil if block ^1 ^2 ^ piston if block ^-1 ^2 ^ piston if block ^1 ^ ^ water_cauldron if block ^-1 ^ ^ water_cauldron run tag @s add terf_wet_mill_case
execute if entity @s[tag=!terf_wet_mill_case] run return fail

execute unless data entity @s data.terf.stored_recipe run return run execute if score NETratetimer terf_states >= NETrate terf_states run function terf:entity/machines/wet_mill/check_item
execute if score @s datapipes_lib_power_storage matches 10.. run return run function terf:entity/machines/wet_mill/operation