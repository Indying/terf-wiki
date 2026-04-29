execute if score @s[tag=terf_gui_selection] terf_data_C matches -1 run data modify block ^-1 ^2 ^1 front_text.messages[2] set value ""
execute if score @s[tag=terf_gui_selection] terf_data_C matches -1 run tag @s remove terf_gui_selection

execute if score @s[tag=terf_gui_linking] terf_data_E matches 0.. run function terf:entity/machines/mainframe/gui/linking/toggle_link

execute if score @s[tag=terf_gui_selection,tag=!terf_gui_linking] terf_data_C matches 0.. run scoreboard players set @s terf_data_E 0
execute if score @s[tag=terf_gui_selection] terf_data_C matches 0.. run tag @s add terf_gui_linking

execute if score @s[tag=terf_gui_linking] terf_data_E matches -1 run tag @s remove terf_gui_linking

function terf:entity/machines/mainframe/gui/update