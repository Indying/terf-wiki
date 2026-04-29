execute if score @s terf_data_A matches 1.. run function terf:entity/machines/assembler/operation

#slower tick
execute unless score NETratetimer terf_states >= NETrate terf_states run return fail

#charge vehicles
scoreboard players operation power_storage terf_states = @s datapipes_lib_power_storage
execute positioned ~-3 ~-.1 ~-3 as @e[tag=terf_vehicle,dx=5,dy=5,dz=5] run function terf:entity/machines/assembler/charge_vehicle
scoreboard players operation @s datapipes_lib_power_storage = power_storage terf_states

#mainframe update buffering
execute if score @s terf_connected_mainframe_buffer = @s terf_connected_mainframe_buffer run scoreboard players operation @s terf_connected_mainframe = @s terf_connected_mainframe_buffer
execute unless score @s terf_connected_mainframe_buffer = @s terf_connected_mainframe_buffer run scoreboard players reset @s terf_connected_mainframe
scoreboard players reset @s terf_connected_mainframe_buffer
