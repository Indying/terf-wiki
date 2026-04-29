execute as @s[tag=!terf_cp_connected] run function terf:entity/machines/stfr_control_panel/no_signal_screen
tag @s remove terf_cp_connected

#mainframe update buffering
execute if score @s terf_connected_mainframe_buffer = @s terf_connected_mainframe_buffer run scoreboard players operation @s terf_connected_mainframe = @s terf_connected_mainframe_buffer
execute unless score @s terf_connected_mainframe_buffer = @s terf_connected_mainframe_buffer run scoreboard players reset @s terf_connected_mainframe
scoreboard players reset @s terf_connected_mainframe_buffer
