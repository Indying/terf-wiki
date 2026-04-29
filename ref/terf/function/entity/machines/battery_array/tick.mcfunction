#display
scoreboard players operation calc terf_states = @s datapipes_lib_power_max
scoreboard players operation calc2 terf_states = @s datapipes_lib_power_storage
data modify block ^ ^ ^1 front_text set value {color:yellow,has_glowing_text:1b,messages:[{"text":"| Battery Array |"},[{"text":"Max: ","color":"#222200"},{"score":{"objective":"terf_states","name":"calc"}}],{"text":"Stored (MWt):","color":"black"},{"score":{"objective":"terf_states","name":"calc2"}}]}
data modify block ^ ^ ^1 is_waxed set value 1b

#overcharge explosion
execute if score @s datapipes_lib_power_storage >= @s datapipes_lib_power_max if score @s datapipes_lib_power_max matches 1.. run function terf:entity/machines/battery_array/overcharge_tick

execute unless score NETrate terf_states <= NETratetimer terf_states run return fail
#comparator output
scoreboard players operation temp terf_states = @s datapipes_lib_power_max
scoreboard players operation temp terf_states /= 100 terf_states
scoreboard players operation temp2 terf_states = @s datapipes_lib_power_storage
scoreboard players operation temp2 terf_states /= temp terf_states
execute if score temp2 terf_states matches ..84 positioned ~ ~-1 ~ if block ~ ~ ~ #minecraft:cauldrons run setblock ~ ~ ~ cauldron
execute if score temp2 terf_states matches 85..94 positioned ~ ~-1 ~ if block ~ ~ ~ #minecraft:cauldrons run setblock ~ ~ ~ water_cauldron[level=1]
execute if score temp2 terf_states matches 95..98 positioned ~ ~-1 ~ if block ~ ~ ~ #minecraft:cauldrons run setblock ~ ~ ~ water_cauldron[level=2]
execute if score temp2 terf_states matches 99.. positioned ~ ~-1 ~ if block ~ ~ ~ #minecraft:cauldrons run setblock ~ ~ ~ water_cauldron[level=3]

#structure checks
data remove entity @s data.power
execute if block ~ ~ ~ anvil if block ^ ^-1 ^ #minecraft:cauldrons run data modify entity @s data.power set value {outpos:"^ ^-2 ^",checks:"if block ^ ^-2 ^ red_glazed_terracotta"}

scoreboard players set mode terf_states 0
scoreboard players set temp terf_states 0
execute positioned ^ ^-2 ^ run function terf:entity/machines/battery_array/count_cables_on
scoreboard players operation temp terf_states *= mwt_per_battery_block terf_states
scoreboard players operation @s datapipes_lib_power_max = temp terf_states

execute positioned ^ ^-2 ^ run function terf:entity/machines/battery_array/count_cables_off
