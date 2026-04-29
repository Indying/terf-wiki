tag @s remove terf_controls_locked
execute if block ^-5 ^2 ^2 lever[powered=true] run tag @s add terf_controls_locked

tag @e[type=marker,tag=terf_stfr_controller,distance=..0.1] add terf_cp_connected
tag @s add terf_cp_connected

execute if block ^ ^ ^1 minecraft:note_block run tag @s add terf_speakerconnected
execute unless block ^ ^ ^1 minecraft:note_block run tag @s remove terf_speakerconnected

execute if entity @s[tag=!terf_controls_locked] run function terf:entity/machines/stfr_control_panel/controls_button_detection

################################################
#==========| Alarms

#high and low core spin alarms
execute as @s[tag=terf_high_core_spin_alarm] run function terf:entity/machines/stfr/sound/alarm_high_spin_tick
execute unless score @s terf_data_A matches 0..2 as @s[tag=terf_low_core_spin_alarm] run function terf:entity/machines/stfr/sound/alarm_low_spin_tick

#high and low temperature alarms
execute as @s[tag=terf_high_temp_alarm] run function terf:entity/machines/stfr/sound/alarm_high_temp_tick
execute unless score @s terf_data_A matches 0..2 unless score @s terf_data_A matches 4 if score core_temp_divided terf_states matches ..15000 run function terf:entity/machines/stfr/sound/alarm_low_temp_tick

#high pressure alarm
execute as @s[tag=terf_high_pressure_alarm] run function terf:entity/machines/stfr/sound/alarm_high_pressure_tick

#high case pressure alarm
execute as @s[tag=terf_case_pressure_high_alarm] run function terf:entity/machines/stfr/sound/alarm_high_case_pressure_tick

#case degradation alarm
execute if score case_temp_divided terf_states matches 1010.. run function terf:entity/machines/stfr/sound/alarm_case_degradation_tick

#high stress alarm
execute as @s[tag=terf_shield_stress_high_alarm] run function terf:entity/machines/stfr/sound/alarm_high_stress_tick

#integrity alarm
execute unless score @s terf_data_A matches 0..2 if score shield_stress terf_states matches 100.. if score shield_integrity_divided terf_states matches ..95 run function terf:entity/machines/stfr/sound/alarm_integrity_tick

#structure alarm
execute unless score working_systems terf_states matches 10 unless score @s terf_data_A matches 0..2 run function terf:entity/machines/stfr/sound/alarm_structure_tick

#reaction loss alarm
execute if score @s terf_data_A matches 8 run function terf:entity/machines/stfr/sound/alarm_reaction_loss_tick

#maintenance alarm
execute if score maintenance terf_states matches 0 run tag @s remove terf_alarm_maintenance
execute as @s[tag=terf_alarm_maintenance] run function terf:entity/machines/stfr/sound/alarm_maintenance_tick

#power surge alarm
execute if score @s terf_data_U matches 1.. run function terf:entity/machines/stfr/sound/alarm_power_surge

#overload alarm
execute if score @s terf_data_A matches 5 run function terf:entity/machines/stfr/sound/alarm_overload_tick

#startup alarm
execute as @s[tag=terf_core_starting_alarm] run function terf:entity/machines/stfr/sound/alarm_startup_tick

#low fuel alarm
execute as @s[tag=terf_low_fuel_alarm] run function terf:entity/machines/stfr/sound/alarm_low_fuel_tick

################################################

execute unless score @s terf_data_A matches 16 run function terf:entity/machines/stfr_control_panel/front_screens
execute if score @s terf_data_E matches 280.. if score @s terf_data_A matches 16 run function terf:entity/machines/stfr_control_panel/front_screens_stab_loss

data modify block ^3 ^3 ^2 front_text set from storage terf:temp displays.group_main[0]
data modify block ^2 ^3 ^2 front_text set from storage terf:temp displays.group_main[1]
data modify block ^1 ^3 ^2 front_text set from storage terf:temp displays.group_core[0]
data modify block ^ ^3 ^2 front_text set from storage terf:temp displays.group_core[1]
data modify block ^-1 ^3 ^2 front_text set from storage terf:temp displays.group_core[2]
data modify block ^3 ^2 ^2 front_text set from storage terf:temp displays.group_main[5]
data modify block ^2 ^2 ^2 front_text set from storage terf:temp displays.group_main[6]
data modify block ^1 ^2 ^2 front_text set from storage terf:temp displays.group_main[7]
data modify block ^ ^2 ^2 front_text set from storage terf:temp displays.group_main[8]
data modify block ^-1 ^2 ^2 front_text set from storage terf:temp displays.group_main[9]

################################################

#broadcast
execute if score NETratetimer terf_states >= NETrate terf_states run function terf:entity/machines/stfr/broadcast_tell

################################################
execute if score @s terf_data_A matches 16 run return fail

#startup overload text
execute if score @s terf_data_A matches 12 if score @s terf_data_E matches 463.. run return run function terf:entity/machines/stfr_control_panel/startup_overload_screen

#self destruct text
execute if score @s terf_data_A matches 15 if score @s terf_data_E matches ..199 run return run function terf:entity/machines/stfr_control_panel/no_signal_screen
execute if score @s terf_data_A matches 15 if score @s terf_data_E matches 200..2304 run return run function terf:entity/machines/stfr_control_panel/self_destruct_screen
execute if score @s terf_data_A matches 15 if score @s terf_data_E matches 2305.. run return run function terf:entity/machines/stfr_control_panel/self_destruct_screen_expired

#screens that dont need to be updated every tick
execute unless score NETratetimer terf_states >= NETrate terf_states run return fail

data modify block ^3 ^4 ^2 front_text set from storage terf:temp displays.structure[0]
data modify block ^2 ^4 ^2 front_text set from storage terf:temp displays.structure[1]
data modify block ^1 ^4 ^2 front_text set from storage terf:temp displays.structure[2]
data modify block ^ ^4 ^2 front_text set from storage terf:temp displays.structure[3]
data modify block ^-1 ^4 ^2 front_text set from storage terf:temp displays.structure[4]

data modify block ^-3 ^3 ^2 front_text set from storage terf:temp displays.group_main[2]
data modify block ^-4 ^3 ^2 front_text set from storage terf:temp displays.group_main[3]
data modify block ^-5 ^3 ^2 front_text set from storage terf:temp displays.group_main[4]
