tag @n[type=marker,distance=..0.1] add terf_cp_connected

#structure screen
data modify block ^1 ^4 ^-1 front_text set from storage terf:temp displays.structure
data modify block ^-1 ^4 ^-1 front_text set from storage terf:temp displays.power
data modify block ^-2 ^4 ^-1 front_text set from storage terf:temp displays.fuel
data modify block ^ ^4 ^-1 front_text set from storage terf:temp displays.status

#controls
execute if block ^1 ^2 ^ #terf:redstoneactive[powered=false] run tag @s remove terf_warp_core_show_range
execute if block ^1 ^2 ^ #terf:redstoneactive[powered=true] run tag @s add terf_warp_core_show_range

execute if block ^-2 ^2 ^ lever if block ^2 ^2 ^ lever run tag @s remove terf_ready
execute if block ^-2 ^2 ^ lever[powered=true] if block ^2 ^2 ^ lever[powered=true] run tag @s add terf_ready

execute positioned ^ ^2 ^ if block ~ ~ ~ #minecraft:buttons[powered=true] if score @s terf_data_A matches 0 if entity @s[tag=!terf_warp_core_coords_checked] at @s run function terf:entity/machines/warp_core/validate/start with entity @s data.terf
execute positioned ^ ^2 ^ if block ~ ~ ~ #minecraft:buttons[powered=false] if score @s terf_data_A matches 0 run tag @s remove terf_warp_core_coords_checked

execute if entity @s[tag=terf_ready] positioned ^-1 ^2 ^ if predicate terf:is_block_active if score @s terf_data_A matches 0 at @s run function terf:entity/machines/warp_core/states/warp/start
