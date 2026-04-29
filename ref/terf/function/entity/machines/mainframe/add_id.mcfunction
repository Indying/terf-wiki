scoreboard players set temp3 terf_states 0
execute store result score temp3 terf_states run data get entity @s data.terf.mainframe_logistics.config.load
scoreboard players operation temp4 terf_states += temp3 terf_states

scoreboard players operation @s terf_connected_mainframe_buffer = temp2 terf_states

execute if data entity @s data.terf.mainframe_logistics.config.is_input run data modify storage terf:temp mainframe_buffer.input_machines append from entity @s data.terf.machine_id
execute if data entity @s data.terf.mainframe_logistics.config.is_output run data modify storage terf:temp mainframe_buffer.output_machines append from entity @s data.terf.machine_id