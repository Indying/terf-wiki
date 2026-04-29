tag @s add terf_powered

#fail if port is broken
scoreboard players set succeeded terf_states 0
execute if block ^1 ^2 ^ minecraft:waxed_oxidized_cut_copper if block ^1 ^2 ^1 minecraft:waxed_oxidized_cut_copper if block ^1 ^2 ^2 minecraft:waxed_lightning_rod[facing=up] if block ^ ^2 ^-1 minecraft:waxed_oxidized_cut_copper if block ^ ^2 ^ minecraft:observer[facing=down] if block ^ ^2 ^1 minecraft:waxed_cut_copper_stairs[half=top] if block ^-1 ^2 ^ minecraft:waxed_oxidized_cut_copper if block ^-1 ^2 ^1 minecraft:waxed_oxidized_cut_copper if block ^-1 ^2 ^2 minecraft:waxed_lightning_rod[facing=up] if block ^1 ^1 ^ minecraft:waxed_oxidized_cut_copper if block ^1 ^1 ^1 minecraft:waxed_oxidized_cut_copper if block ^1 ^1 ^2 minecraft:waxed_lightning_rod[facing=down] if block ^ ^1 ^-1 minecraft:waxed_oxidized_cut_copper if block ^-1 ^1 ^ minecraft:waxed_oxidized_cut_copper if block ^-1 ^1 ^1 minecraft:waxed_oxidized_cut_copper if block ^-1 ^1 ^2 minecraft:waxed_lightning_rod[facing=down] if block ^1 ^ ^ minecraft:waxed_oxidized_cut_copper if block ^1 ^ ^1 minecraft:waxed_oxidized_cut_copper if block ^1 ^ ^2 minecraft:waxed_cut_copper_stairs[half=bottom] if block ^ ^ ^-1 minecraft:waxed_oxidized_cut_copper if block ~ ~ ~ minecraft:waxed_oxidized_cut_copper if block ^ ^ ^1 minecraft:waxed_oxidized_cut_copper if block ^-1 ^ ^ minecraft:waxed_oxidized_cut_copper if block ^-1 ^ ^1 minecraft:waxed_oxidized_cut_copper if block ^-1 ^ ^2 minecraft:waxed_cut_copper_stairs[half=bottom] run scoreboard players set succeeded terf_states 1
execute if score succeeded terf_states matches 0 run return run data merge block ^ ^2 ^2 {is_waxed:1b,front_text:{has_glowing_text:1b,color:red,messages:["Port Structure","Broken","|","V"]}}

#check for fuel
scoreboard players set has_fuel terf_states 0
execute if block ^ ^1 ^ minecraft:netherite_block run scoreboard players set has_fuel terf_states 1

#find laser
scoreboard players set status terf_states 0
scoreboard players set terminated terf_states 100
execute positioned ^ ^3 ^ run function terf:entity/machines/stasis_laser/cable_checks

execute if score status terf_states matches 0 run return run data merge block ^ ^2 ^2 {is_waxed:1b,front_text:{has_glowing_text:1b,color:red,messages:["No Laser Found","|","|","V"]}}
execute if score status terf_states matches 1 run return run data merge block ^ ^2 ^2 {is_waxed:1b,front_text:{has_glowing_text:1b,color:red,messages:["Laser Structure","Broken","|","V"]}}
execute if score status terf_states matches 2 run return run data merge block ^ ^2 ^2 {is_waxed:1b,front_text:{has_glowing_text:1b,color:red,messages:["No Reactor","Found","|","V"]}}
execute if score status terf_states matches 3 run return run data merge block ^ ^2 ^2 {is_waxed:1b,front_text:{has_glowing_text:1b,color:orange,messages:["No Power Source","|","|","V"]}}
execute if score status terf_states matches 4 run return run data merge block ^ ^2 ^2 {is_waxed:1b,front_text:{has_glowing_text:1b,color:green,messages:["Ready For","Firing","|","V"]}}

#activate
execute unless score status terf_states matches 5 run return fail

data merge block ^ ^2 ^2 {is_waxed:1b,front_text:{has_glowing_text:1b,color:green,messages:[["Standby","."],"","",""]}}
particle poof ~ ~.5 ~ 0.2 0 0.2 0 100 force
execute positioned ^ ^1 ^ run function terf:entity/machines/stasis_laser/block_into_block_display
scoreboard players set @s terf_data_A 1

playsound terf:alarms.beep5 master @a[distance=0..] ~ ~ ~ 8 0