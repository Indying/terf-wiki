function datapipes_lib:require/pipe_presets/copper_wire/pipes_on

#prepare globals
scoreboard players set temp2 terf_states 0
scoreboard players set temp4 terf_states 0
data remove storage terf:temp mainframe_buffer
data remove entity @s data.terf.mainframe
execute store result score temp2 terf_states run data get entity @s data.terf.machine_id 1

#check all connected mainframe-able machines and add their different values to lists
execute as @e[type=minecraft:marker,tag=terf_mainframe_interested] at @s run function terf:entity/machines/mainframe/check_machines_logic_cable

#apply those values to myself
data modify entity @s data.terf.mainframe set from storage terf:temp mainframe_buffer
execute store result score @s terf_data_D run data get storage terf:temp mainframe_buffer.output_machines
execute store result score @s terf_data_B run data get storage terf:temp mainframe_buffer.input_machines
scoreboard players operation @s terf_data_F = temp4 terf_states

function datapipes_lib:require/pipe_presets/copper_wire/pipes_off
