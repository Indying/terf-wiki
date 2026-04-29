tag @e[type=marker,tag=terf_opencore_controller,distance=..0.1] add terf_cp_connected

scoreboard players add @s terf_data_A 0

scoreboard players operation temp terf_states = ETratetimer terf_states
scoreboard players operation temp terf_states %= 2 terf_states
execute if score temp terf_states matches 0 if block ^-1 ^ ^1 observer[powered=true] run function terf:entity/machines/opencore_control_panel/clicked_left_screen
execute if score temp terf_states matches 0 if block ^ ^ ^1 observer[powered=true] run function terf:entity/machines/opencore_control_panel/clicked_middle_screen
execute if score temp terf_states matches 0 if block ^1 ^ ^1 observer[powered=true] run function terf:entity/machines/opencore_control_panel/clicked_right_screen

execute if data block ^-1 ^1 ^1 {front_text:{color:"gray"}} run function terf:entity/machines/opencore_control_panel/clicked_left_screen
execute if data block ^ ^1 ^1 {front_text:{color:"gray"}} run function terf:entity/machines/opencore_control_panel/clicked_middle_screen
execute if data block ^1 ^1 ^1 {front_text:{color:"gray"}} run function terf:entity/machines/opencore_control_panel/clicked_right_screen

data merge block ^ ^2 ^1 {front_text:{color:"blue",messages:["","","",""],has_glowing_text:1b},is_waxed:1b}
data merge block ^-1 ^1 ^1 {front_text:{color:"blue",messages:["","","",""],has_glowing_text:1b},is_waxed:1b}
data merge block ^ ^1 ^1 {front_text:{color:"blue",messages:["","","",""],has_glowing_text:1b},is_waxed:1b}
data merge block ^1 ^1 ^1 {front_text:{color:"blue",messages:["","","",""],has_glowing_text:1b},is_waxed:1b}

execute if score @s terf_data_A matches 0 unless score @s terf_data_D matches 6 run function terf:entity/machines/opencore_control_panel/display_power_laser_hover
execute if score @s terf_data_A matches 10 unless score @s terf_data_D matches 6 run function terf:entity/machines/opencore_control_panel/display_power_laser

execute if score @s terf_data_A matches 1 unless score @s terf_data_D matches 6 run function terf:entity/machines/opencore_control_panel/display_cooling_laser_hover
execute if score @s terf_data_A matches 11 unless score @s terf_data_D matches 6 run function terf:entity/machines/opencore_control_panel/display_cooling_laser

execute if score @s terf_data_A matches 2 unless score @s terf_data_D matches 6 run function terf:entity/machines/opencore_control_panel/display_startup_hover
execute if score @s terf_data_A matches 12 unless score @s terf_data_D matches 6 run function terf:entity/machines/opencore_control_panel/display_startup

execute if score @s terf_data_A matches 3 unless score @s terf_data_D matches 6 run function terf:entity/machines/opencore_control_panel/display_stats_hover
execute if score @s terf_data_A matches 13 unless score @s terf_data_D matches 6 run function terf:entity/machines/opencore_control_panel/display_stats

execute if score @s terf_data_D matches 4 unless score @s terf_data_D matches 6 run function terf:entity/machines/opencore_control_panel/display_top_screen with entity @s data.terf.stored_recipe.operations[0]

execute if score @s terf_data_D matches 6 run function terf:entity/machines/opencore_control_panel/meltdown_screens