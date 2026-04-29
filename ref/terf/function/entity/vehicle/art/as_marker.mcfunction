data modify storage terf:temp temp set from entity @s data.terf.security_config

#mainframe update buffering
execute if score NETratetimer terf_states >= NETrate terf_states if score @s terf_connected_mainframe_buffer = @s terf_connected_mainframe_buffer run scoreboard players operation @s terf_connected_mainframe = @s terf_connected_mainframe_buffer
execute if score NETratetimer terf_states >= NETrate terf_states unless score @s terf_connected_mainframe_buffer = @s terf_connected_mainframe_buffer run scoreboard players reset @s terf_connected_mainframe
execute if score NETratetimer terf_states >= NETrate terf_states run scoreboard players reset @s terf_connected_mainframe_buffer

#shoot warp cores if disconnected from mainframe
#execute as @s[tag=terf_indestructible] unless score @s terf_connected_mainframe = @s terf_connected_mainframe if entity @e[type=minecraft:marker,tag=terf_warp_core,distance=..1000] run scoreboard players set lockdown_mode terf_states 1
