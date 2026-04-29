execute if entity @s[tag=terf_gui_selection,tag=!terf_gui_linking] run scoreboard players add @s terf_data_C 1
execute if entity @s[tag=terf_gui_linking] run scoreboard players add @s terf_data_E 1

tag @s add terf_gui_selection

function terf:entity/machines/mainframe/gui/update