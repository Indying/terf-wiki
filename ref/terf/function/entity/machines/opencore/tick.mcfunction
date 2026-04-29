#terf_data_A = UI state
#terf_data_B = power laser
#terf_data_C = cooling laser
#terf_data_D = reactor state
#terf_data_E = event timer
#terf_data_F = effect timer
#terf_data_G = core temp
#terf_data_H = distance between top and bottom coils
#terf_data_I = core damage

tag @s add terf_broadcaston
tag @s remove terf_indestructible
execute if score @s terf_data_D matches 2.. run tag @s add terf_indestructible

#structure checks
execute if score NETratetimer terf_states >= NETrate terf_states run function terf:entity/machines/opencore/structure_checks

#basic calculations
scoreboard players operation core_temp_divided terf_states = @s terf_data_G

execute if score NETratetimer terf_states >= NETrate terf_states run tag @s remove terf_allsystemsworking
execute if score NETratetimer terf_states >= NETrate terf_states if entity @s[tag=terf_topcoil,tag=terf_bottomcoil,tag=terf_stab_dnw,tag=terf_stab_dne,tag=terf_stab_dse,tag=terf_stab_dsw,tag=terf_stab_unw,tag=terf_stab_une,tag=terf_stab_use,tag=terf_stab_usw] run tag @s add terf_allsystemsworking

scoreboard players set working_stabs terf_states 0
execute as @s[tag=terf_stab_dnw] run scoreboard players add working_stabs terf_states 1
execute as @s[tag=terf_stab_dne] run scoreboard players add working_stabs terf_states 1
execute as @s[tag=terf_stab_dse] run scoreboard players add working_stabs terf_states 1
execute as @s[tag=terf_stab_dsw] run scoreboard players add working_stabs terf_states 1
execute as @s[tag=terf_stab_unw] run scoreboard players add working_stabs terf_states 1
execute as @s[tag=terf_stab_une] run scoreboard players add working_stabs terf_states 1
execute as @s[tag=terf_stab_use] run scoreboard players add working_stabs terf_states 1
execute as @s[tag=terf_stab_usw] run scoreboard players add working_stabs terf_states 1

#use power
scoreboard players operation temp terf_states = @s datapipes_lib_power_max
scoreboard players operation temp terf_states /= 100 terf_states
scoreboard players operation @s datapipes_lib_power_storage -= temp terf_states
execute if score @s datapipes_lib_power_storage matches ..-1 run scoreboard players set @s datapipes_lib_power_storage 0

#update states
execute if score @s terf_data_D matches 1 run function terf:entity/machines/opencore/states/system_check/tick
execute if score @s terf_data_D matches 2 run function terf:entity/machines/opencore/states/indexing/tick
execute if score @s terf_data_D matches 3 run function terf:entity/machines/opencore/states/charging/tick
execute if score @s terf_data_D matches 4 run function terf:entity/machines/opencore/states/online/tick with entity @s data.terf.opencore
execute if score @s terf_data_D matches 5 run function terf:entity/machines/opencore/states/shutdown/tick
execute if score @s terf_data_D matches 6 run function terf:entity/machines/opencore/states/meltdown/tick with entity @s data.terf.opencore

#display stuff on the control panel
tag @s add terf_currententity
scoreboard players operation calc terf_states = @s terf_connected_mainframe
$execute at @e[type=marker,tag=terf_linked_to_$(machine_id),tag=terf_opencore_controller] if score @e[type=marker,distance=..0.01,limit=1] terf_connected_mainframe = calc terf_states if block ~ ~ ~ loom if block ^ ^-1 ^ waxed_cut_copper run function terf:entity/machines/opencore_control_panel/as_core_at_control_panel
tag @s remove terf_currententity

#mainframe update buffering
execute unless score NETratetimer terf_states >= NETrate terf_states run return fail
execute if score @s terf_connected_mainframe_buffer = @s terf_connected_mainframe_buffer run scoreboard players operation @s terf_connected_mainframe = @s terf_connected_mainframe_buffer
execute unless score @s terf_connected_mainframe_buffer = @s terf_connected_mainframe_buffer run scoreboard players reset @s terf_connected_mainframe
scoreboard players reset @s terf_connected_mainframe_buffer

#remove loading tag
tag @s remove terf_oc_loading

#redstone probe integration
scoreboard players operation ui_state terf_states = @s terf_data_A
scoreboard players operation reactor_state terf_states = @s terf_data_D
scoreboard players operation timer terf_states = @s terf_data_F
scoreboard players operation temperature terf_states = @s terf_data_G

#redstone probe integration
scoreboard players operation calc terf_states = @s terf_connected_mainframe
$execute as @e[type=marker,tag=terf_linked_to_$(machine_id),tag=terf_redstone_probe] at @s run function terf:entity/machines/redstone_probe/machine_tick
