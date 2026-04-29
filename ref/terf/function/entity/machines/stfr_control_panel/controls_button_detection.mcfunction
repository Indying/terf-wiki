execute positioned ^-4 ^3 ^-1 if block ~ ~ ~ #terf:button_and_observer[powered=true] run function terf:entity/machines/stfr_control_panel/controls_pressed/stabilizer_offset_up
execute positioned ^-4 ^2 ^ if block ~ ~ ~ #terf:button_and_observer[powered=true] run function terf:entity/machines/stfr_control_panel/controls_pressed/stabilizer_offset_down
execute positioned ^-3 ^3 ^-1 if block ~ ~ ~ #terf:button_and_observer[powered=true] run function terf:entity/machines/stfr_control_panel/controls_pressed/stabilizer_input_up
execute positioned ^-3 ^2 ^ if block ~ ~ ~ #terf:button_and_observer[powered=true] run function terf:entity/machines/stfr_control_panel/controls_pressed/stabilizer_input_down
execute positioned ^-2 ^3 ^-1 if block ~ ~ ~ #terf:button_and_observer[powered=true] run function terf:entity/machines/stfr_control_panel/controls_pressed/power_lasers_up
execute positioned ^-2 ^2 ^ if block ~ ~ ~ #terf:button_and_observer[powered=true] run function terf:entity/machines/stfr_control_panel/controls_pressed/power_lasers_down
execute positioned ^1 ^3 ^-1 if block ~ ~ ~ #terf:button_and_observer[powered=true] run function terf:entity/machines/stfr_control_panel/controls_pressed/pressure_vent_up
execute positioned ^1 ^2 ^ if block ~ ~ ~ #terf:button_and_observer[powered=true] run function terf:entity/machines/stfr_control_panel/controls_pressed/pressure_vent_down
execute positioned ^2 ^3 ^-1 if block ~ ~ ~ #terf:button_and_observer[powered=true] run function terf:entity/machines/stfr_control_panel/controls_pressed/fuel_injection_up
execute positioned ^2 ^2 ^ if block ~ ~ ~ #terf:button_and_observer[powered=true] run function terf:entity/machines/stfr_control_panel/controls_pressed/fuel_injection_down
execute positioned ^3 ^3 ^-1 if block ~ ~ ~ #terf:button_and_observer[powered=true] run function terf:entity/machines/stfr_control_panel/controls_pressed/rf_suppression_up
execute positioned ^3 ^2 ^ if block ~ ~ ~ #terf:button_and_observer[powered=true] run function terf:entity/machines/stfr_control_panel/controls_pressed/rf_suppression_down
execute if block ^-3 ^4 ^2 #terf:button_and_observer[powered=true] run function terf:entity/machines/stfr_control_panel/mute_alarms

execute if block ^-5 ^4 ^2 #terf:redstoneactive[powered=false] run tag @s remove terf_broadcaston
execute if block ^-5 ^4 ^2 #terf:redstoneactive[powered=true] run tag @s add terf_broadcaston

execute if block ^-4 ^4 ^2 #terf:redstoneactive[powered=false] run tag @s remove terf_key_on
execute if block ^-4 ^4 ^2 #terf:redstoneactive[powered=true] run tag @s add terf_key_on

execute if score @s terf_data_A matches 0 as @s[tag=terf_key_on,tag=terf_sstb_on] run function terf:entity/machines/stfr/states/startup/prime
execute if score @s terf_data_A matches 3 unless score stfr_hardcore_mode terf_states matches 1 as @s[tag=!terf_key_on,tag=terf_sstb_on] if score shield_stress terf_states matches ..19 run function terf:entity/machines/stfr/states/shutdown/initiate
execute if score @s terf_data_A matches 3 if score stfr_hardcore_mode terf_states matches 1 as @s[tag=!terf_key_on,tag=terf_sstb_on] if score shield_stress terf_states matches ..7 run function terf:entity/machines/stfr/states/shutdown/initiate

execute if score @s terf_data_A matches 1 as @s[tag=terf_key_on,tag=terf_sstb_on,tag=terf_breakers_activated] if score working_stabs terf_states matches 1.. run function terf:entity/machines/stfr/states/startup_confirmed/confirm_startup with entity @s data.terf

execute if score @s terf_data_A matches 3 as @s[tag=terf_key_on,tag=terf_sstb_on] if score @s terf_data_U matches 2 run function terf:entity/machines/stfr/emergency_controls/power_surge/confirm

execute if score @s terf_data_A matches 8 if score stabs_fixed terf_states matches 5.. as @s[tag=terf_key_on,tag=terf_sstb_on] run function terf:entity/machines/stfr/states/reaction_loss/reignition_initiate

execute if score @s terf_data_A matches 17 if score @s terf_data_Ab matches -1 if score @s terf_data_E matches ..4049 as @s[tag=terf_key_on,tag=terf_sstb_on] if function terf:entity/machines/stfr/states/shutdown_failure/has_only_water_capsules run function terf:entity/machines/stfr/states/shutdown_failure/start_restabilization with entity @s data.terf

execute unless score @s[tag=!terf_power_surge_pressed,tag=terf_key_on] terf_data_U matches 1.. if score @s terf_data_Ad matches 950000.. if score @s terf_data_A matches 3 positioned ^ ^-1 ^1 if predicate terf:is_block_active run function terf:entity/machines/stfr/emergency_controls/power_surge/prime
execute if score @s[tag=!terf_power_surge_pressed,tag=!terf_stfr_surge_unabortable] terf_data_U matches 2..599 positioned ^ ^-1 ^1 if predicate terf:is_block_active run function terf:entity/machines/stfr/emergency_controls/power_surge/abort_manual
execute if score @s[tag=!terf_key_on,tag=!terf_stfr_surge_unabortable] terf_data_U matches 2..599 run function terf:entity/machines/stfr/emergency_controls/power_surge/abort_manual

execute positioned ^ ^-1 ^-1 if predicate terf:is_block_active run tag @s add terf_case_shield_primed
execute positioned ^ ^-1 ^-1 unless predicate terf:is_block_active run tag @s remove terf_case_shield_primed

execute if score @s terf_data_U matches 1 run scoreboard players set @s terf_data_U 2

tag @s remove terf_power_surge_pressed
execute positioned ^ ^-1 ^1 if predicate terf:is_block_active run tag @s add terf_power_surge_pressed

execute if block ^-3 ^2 ^2 #terf:redstoneactive[powered=true] run function terf:entity/machines/stfr_control_panel/controls_pressed/fit_graph

execute if score @s terf_data_A matches 5 if score stab_lenses terf_states matches 4.. as @s[tag=terf_key_on,tag=terf_sstb_on,tag=!terf_manual_stabilization_failed] run function terf:entity/machines/stfr/states/manual_restabilization/start
execute if score @s terf_data_A matches 16 if score working_stabs terf_states matches 3.. as @s[tag=terf_key_on,tag=terf_sstb_on,tag=!terf_restabilizing] run function terf:entity/machines/stfr/states/stabilizer_loss/restabilization_start with entity @s data.terf

execute if block ^-4 ^2 ^2 #terf:button_and_observer[powered=false] run tag @s remove terf_sstb_on
execute if block ^-4 ^2 ^2 #terf:button_and_observer[powered=true] run tag @s add terf_sstb_on

execute if score @s terf_data_A matches 0 run tag @s remove terf_broadcaston
