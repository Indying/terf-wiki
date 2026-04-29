#mainframe update buffering
execute if score NETratetimer terf_states >= NETrate terf_states if score @s terf_connected_mainframe_buffer = @s terf_connected_mainframe_buffer run scoreboard players operation @s terf_connected_mainframe = @s terf_connected_mainframe_buffer
execute if score NETratetimer terf_states >= NETrate terf_states unless score @s terf_connected_mainframe_buffer = @s terf_connected_mainframe_buffer run scoreboard players reset @s terf_connected_mainframe
execute if score NETratetimer terf_states >= NETrate terf_states run scoreboard players reset @s terf_connected_mainframe_buffer
