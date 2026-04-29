#playsound custom:alarm3 master @a[distance=0..] ~ ~ ~ 100000000 0
#playsound custom:alarm3 master @a[distance=0..] ~ ~ ~ 100000000 0
#playsound custom:alarm3 master @a[distance=0..] ~ ~ ~ 100000000 0
#playsound custom:meltdownsiren master @a[distance=0..] ~ ~ ~ 100000000 0
#playsound custom:meltdownsiren master @a[distance=0..] ~ ~ ~ 100000000 0
#playsound custom:alarm master @a[distance=0..] ~ ~ ~ 100000000 0
#playsound custom:alarm master @a[distance=0..] ~ ~ ~ 100000000 0.1
#playsound custom:alarm master @a[distance=0..] ~ ~ ~ 100000000 0.2

execute if score core_spin_absolute terf_states matches ..81000 as @s[tag=!terf_low_core_spin] run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.bct.low_core_spin',level:1,text:'{"text":"Fusion Reactor Core Spin Level Below Recommended Safe Parameters!","color":"aqua"}'}
execute if score core_spin_absolute terf_states matches ..81000 as @s[tag=!terf_low_core_spin] run tag @s add terf_low_core_spin_alarm
execute if score core_spin_absolute terf_states matches ..81000 run tag @s add terf_low_core_spin
execute if score core_spin_absolute terf_states matches 82000.. run tag @s remove terf_low_core_spin
execute if score core_spin_absolute terf_states matches 82000.. run tag @s remove terf_low_core_spin_alarm

execute if score @s terf_data_Y matches ..6000 as @s[tag=!terf_low_fuel] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_low_fuel",voiceline:'stfr.bct.terf_low_fuel',level:1,text:'{"text":"Fusion Reactor Capsule Fuel Levels Low. Refueling The Reactor Is Recommended.","color":"yellow"}'}
execute if score @s terf_data_Y matches 6001.. run tag @s remove terf_low_fuel

execute if score @s terf_data_Y matches ..3000 as @s[tag=!terf_low_fuel_crit] run tag @s add terf_low_fuel_alarm
execute if score @s terf_data_Y matches ..3000 as @s[tag=!terf_low_fuel_crit] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_low_fuel_crit",voiceline:'stfr.bct.terf_low_fuel_crit',level:2,text:'{"text":"Fusion Reactor Capsule Fuel Levels Critically Low! Fuel Injection May Cutoff Unexpectedly!","color":"red"}'}
execute if score @s terf_data_Y matches 3001.. run tag @s remove terf_low_fuel_crit
execute if score @s terf_data_Y matches 3001.. run tag @s remove terf_low_fuel_alarm

execute if score core_spin_absolute terf_states matches 150000.. as @s[tag=!terf_high_core_spin] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_high_core_spin",voiceline:'stfr.bct.high_core_spin',level:1,text:'{"text":"Fusion Reactor Core Spin Exceeding Recommended Safe Parameters! Shield stress rising exponentially!","color":"white"}'}
execute if score core_spin_absolute terf_states matches 150000.. as @s[tag=!terf_high_core_spin] run tag @s add terf_high_core_spin_alarm
execute if score core_spin_absolute terf_states matches ..149500 run tag @s remove terf_high_core_spin
execute if score core_spin_absolute terf_states matches ..149500 run tag @s remove terf_high_core_spin_alarm

execute if score @s terf_data_M < @s terf_data_R as @s[tag=!terf_low_temp] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_low_temp",voiceline:'stfr.bct.terf_low_temp',level:2,text:'{"text":"Fusion Reactor Core Temperature Below Reactivity Peak! Core Reactivity Dropping Rapidly.","color":"aqua"}'}
execute if score @s terf_data_M > @s terf_data_R run tag @s remove terf_low_temp

scoreboard players operation temp terf_states = @s terf_data_R
scoreboard players operation temp terf_states *= 4 terf_states
scoreboard players operation temp terf_states /= 4 terf_states
execute if score @s terf_data_M > temp terf_states as @s[tag=!terf_high_temp] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_high_temp",voiceline:'stfr.bct.terf_high_temp',level:2,text:'{"text":"Fusion Reactor Core Temperature Over 1.5x The Reactivity Peak!","color":"yellow"}'}
execute if score @s terf_data_M < temp terf_states as @s[tag=!terf_high_temp] run tag @s add terf_high_temp_alarm
execute if score @s terf_data_M < temp terf_states run tag @s remove terf_high_temp_alarm
execute if score @s terf_data_M < temp terf_states run tag @s remove terf_high_temp

execute if score coolant_amount terf_states matches ..2500000 as @s[tag=!terf_low_coolant] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_low_coolant",voiceline:'stfr.bct.low_coolant',level:2,text:'{"text":"Fusion Reactor Coolant Amount Low! (<2500000mb) Lower Heat Transfer Immediately!","color":"gold"}'}
execute if score coolant_amount terf_states matches 2500000.. run tag @s remove terf_low_coolant

execute if score coolant_amount terf_states matches ..200000 as @s[tag=!terf_crit_coolant] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_crit_coolant",voiceline:'stfr.bct.crit_coolant',level:3,text:'{"text":"Fusion Reactor Coolant Amount Critical! (<200000mb) Case Temperature May Rise Uncontrollably!","color":"red"}'}
execute if score coolant_amount terf_states matches 200000.. run tag @s remove terf_crit_coolant

execute if score core_pressure terf_states matches ..1000000 as @s[tag=!terf_low_pressure_crit] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_low_pressure_crit",voiceline:'stfr.bct.low_pressure_crit',level:3,text:'{"text":"Containment Shield Rigidity Lost Due To Extremely Low Pressure Forces! Shield Collapse Imminent!","color":"aqua"}'}
execute if score core_pressure terf_states matches 1100000.. run tag @s remove terf_low_pressure_crit

execute if score core_pressure terf_states matches ..150000 as @s[tag=!terf_low_pressure] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_low_pressure",voiceline:'stfr.bct.low_pressure',level:1,text:'{"text":"Fusion Reactor Core Pressure Below Recommended Shield Rigidity Margins!","color":"aqua"}'}
execute if score core_pressure terf_states matches 155000.. run tag @s remove terf_low_pressure

execute if score core_pressure terf_states matches 5000000.. as @s[tag=!terf_high_pressure] run tag @s add terf_high_pressure_alarm
execute if score core_pressure terf_states matches 5000000.. as @s[tag=!terf_high_pressure] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_high_pressure",voiceline:'stfr.bct.high_pressure',level:1,text:'{"text":"Fusion Reactor Core Pressure Exceeding Recommended Safe Parameters!","color":"white"}'}
execute if score core_pressure terf_states matches ..495000 run tag @s remove terf_high_pressure
execute if score core_pressure terf_states matches ..495000 run tag @s remove terf_high_pressure_alarm

execute if score case_pressure terf_states matches 700000000.. as @s[tag=!terf_case_pressure_high] run tag @s add terf_case_pressure_high_alarm
execute if score case_pressure terf_states matches 700000000.. as @s[tag=!terf_case_pressure_high] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_case_pressure_high",voiceline:'stfr.bct.case_pressure_high',level:2,text:'{"text":"Fusion Reactor Case Pressure Exceeding Recommended Safe Parameters!","color":"yellow"}'}
execute if score case_pressure terf_states matches ..650000000 run tag @s remove terf_case_pressure_high
execute if score case_pressure terf_states matches ..650000000 run tag @s remove terf_case_pressure_high_alarm

execute if score case_pressure terf_states matches 800000000.. as @s[tag=!terf_case_pressure_crit] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_case_pressure_crit",voiceline:'stfr.bct.case_pressure_crit',level:3,text:'{"text":"Fusion Reactor Case Pressure Critical! Case Failure Imminent!","color":"red"}'}
execute if score case_pressure terf_states matches ..750000000 run tag @s remove terf_case_pressure_crit

execute if score shield_stress terf_states matches 100.. as @s[tag=!terf_shield_stress_crit] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_shield_stress_crit",voiceline:'stfr.bct.shield_stress_crit',level:2,text:'{"text":"Fusion Reactor Shield Stress Critical! (>100%) Shield Intensity Degradation Detected! Stress Breakdown: ","color":"gold,{"score":{"objective":"terf_states","name":"pressure_shield_stress"}},{"text":"% Pressure, "},{"score":{"objective":"terf_states","name":"spin_shield_stress"}},{"text":"% Core Spin "},{"score":{"objective":"terf_states","name":"shield_collapse_stress"}},{"text":"% Rigidity Losses"}'}
execute if score shield_stress terf_states matches ..98 run tag @s remove terf_shield_stress_crit

execute if score shield_stress terf_states matches 85.. as @s[tag=!terf_shield_stress_high] run tag @s add terf_shield_stress_high_alarm
execute if score shield_stress terf_states matches 85.. as @s[tag=!terf_shield_stress_high] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_shield_stress_high",voiceline:'stfr.bct.shield_stress_high',level:1,text:'{"text":"Fusion Reactor Shield Stress High! >85% Stress Breakdown: ","color":"white"},{"score":{"objective":"terf_states","name":"pressure_shield_stress"}},{"text":"% Pressure, "},{"score":{"objective":"terf_states","name":"spin_shield_stress"}},{"text":"% Core Spin "},{"score":{"objective":"terf_states","name":"shield_collapse_stress"}},{"text":"% Rigidity Losses"}'}
execute if score shield_stress terf_states matches ..83 run tag @s remove terf_shield_stress_high
execute if score shield_stress terf_states matches ..83 run tag @s remove terf_shield_stress_high_alarm

execute if score shield_intensity_divided terf_states matches ..0 as @s[tag=!terf_intensity_crit] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_intensity_crit",voiceline:'stfr.bct.intensity_crit',level:3,text:'{"text":"Reactor Containment Shield Intensity Critical!","color":"gold"},{"text":" !!SHIELD FAILURE IMMINENT!!","color":"red"}'}
execute if score shield_intensity_divided terf_states matches 2.. run tag @s remove terf_intensity_crit

execute if score shield_intensity_divided terf_states matches ..25 as @s[tag=!terf_intensity_25] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_intensity_25",voiceline:'stfr.bct.intensity_25',level:2,text:'{"text":"Reactor Containment Shield Intensity At 25%!","color":"gold"}'}
execute if score shield_intensity_divided terf_states matches 27.. run tag @s remove terf_intensity_25

execute if score shield_intensity_divided terf_states matches ..50 as @s[tag=!terf_intensity_50] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_intensity_50",voiceline:'stfr.bct.intensity_50',level:2,text:'{"text":"Reactor Containment Shield Intensity At 50%!","color":"gold"}'}
execute if score shield_intensity_divided terf_states matches 52.. run tag @s remove terf_intensity_50

execute if score shield_intensity_divided terf_states matches ..75 as @s[tag=!terf_intensity_75] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_intensity_75",voiceline:'stfr.bct.intensity_75',level:2,text:'{"text":"Reactor Containment Shield Intensity At 75%!","color":"gold"}'}
execute if score shield_intensity_divided terf_states matches 77.. run tag @s remove terf_intensity_75

execute if score case_temp_divided terf_states matches 950.. as @s[tag=!terf_case_temp_high] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_case_temp_high",voiceline:'stfr.bct.case_temp_high',level:2,text:'{"text":"Fusion Reactor Case Temperature Exceeding Recommended Safe Parameters!","color":"yellow"}'}
execute if score case_temp_divided terf_states matches ..940 run tag @s remove terf_case_temp_high

execute if score case_temp_divided terf_states matches 1010.. as @s[tag=!terf_case_temp_crit] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_case_temp_crit",voiceline:'stfr.bct.case_temp_crit',level:3,text:'{"text":"Fusion Reactor Case Temperature Critical! Case Degradation Imminent!","color":"red"}'}
execute if score case_temp_divided terf_states matches ..1000 run tag @s remove terf_case_temp_crit

execute as @s[tag=terf_outtake_blocked,tag=!terf_no_outtake] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_no_outtake",voiceline:'stfr.bct.no_outtake',level:1,text:'[{"text":"Fusion Reactor Steam Outtake Buffer Full! This Could Be Caused By ","color":"gold"},{"text":"Too Much Heat Tranfer Rate","bold":true,"color":"white"},{"text":" Or a Pipe Fault.","color":"gold"}]'}
execute as @s[tag=!terf_outtake_blocked] run tag @s remove terf_no_outtake

execute as @s[tag=terf_intake_leaking,tag=!terf_no_intake] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_no_intake",voiceline:'stfr.bct.no_intake',level:2,text:'{"text":"Fusion Reactor Coolant Leak Detected!","color":"gold"}'}
execute as @s[tag=!terf_intake_leaking] run tag @s remove terf_no_intake

execute if score turbine_count terf_states matches 0 as @s[tag=!terf_turbines_disconnected] run scoreboard players operation @s terf_data_S = working_turbines terf_states
execute if score turbine_count terf_states matches 0 as @s[tag=!terf_turbines_disconnected] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_turbines_disconnected",voiceline:'stfr.bct.turbine_connection_lost',level:1,text:'{"text":"Connection To Turbines Lost!","color":"gold"}'}
execute if score turbine_count terf_states matches 1.. as @s[tag=terf_turbines_disconnected] run scoreboard players operation @s terf_data_S = working_turbines terf_states
execute if score turbine_count terf_states matches 1.. as @s[tag=terf_turbines_disconnected] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s remove terf_turbines_disconnected",voiceline:'stfr.bct.turbine_connection_restore',level:1,text:'{"text":"Connection To Turbines Restored!","color":"green"}'}

execute unless score working_turbines terf_states = @s terf_data_S if score working_turbines terf_states < @s terf_data_S run function terf:entity/machines/stfr/broadcast {bcd:"scoreboard players operation @s terf_data_S = working_turbines terf_states",voiceline:'stfr.bct.turbine_breach',level:1,text:'{"text":"Fusion Reactor Turbine Damage Detected! Functional: ","color":"gold"},{"score":{"objective":"terf_states","name":"working_turbines"},color:"red"},{text:"/",color:"red"},{"score":{"objective":"terf_states","name":"turbine_count"},color:"red"}'}
execute unless score working_turbines terf_states = @s terf_data_S if score working_turbines terf_states > @s terf_data_S run function terf:entity/machines/stfr/broadcast {bcd:"scoreboard players operation @s terf_data_S = working_turbines terf_states",voiceline:'stfr.bct.turbine_restore',level:1,text:'{"text":"Fusion Reactor Turbine Restored! Functional: ","color":"green"},{"score":{"objective":"terf_states","name":"working_turbines"}},"/",{"score":{"objective":"terf_states","name":"turbine_count"}}'}

#structure
execute as @s[tag=!terf_stab_pistons,tag=!terf_stab_pistons_breach] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_stab_pistons_breach",voiceline:'stfr.bct.pistons_breach',level:1,text:'{"text":"Fusion Reactor Stabilizer Piston Failure Detected!","color":"gold"}'}
execute as @s[tag=terf_stab_pistons,tag=terf_stab_pistons_breach] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s remove terf_stab_pistons_breach",voiceline:'stfr.bct.pistons_restore',level:1,text:'{"text":"Fusion Reactor Stabilizer Pistons Restored!","color":"green"}'}

execute as @s[tag=!terf_case,tag=!terf_case_breach] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_case_breach",voiceline:'stfr.bct.case_breach',level:1,text:'{"text":"Fusion Reactor Case Breach Detected!","color":"gold"}'}
execute as @s[tag=terf_case,tag=terf_case_breach] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s remove terf_case_breach",voiceline:'stfr.bct.case_restore',level:1,text:'{"text":"Fusion Reactor Case Restored!","color":"green"}'}

execute as @s[tag=!terf_stab1,tag=!terf_stab1_breach] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_stab1_breach",voiceline:'stfr.bct.stab1_breach',level:1,text:'{"text":"Fusion Reactor Stabilizer U Failure!","color":"gold"}'}
execute as @s[tag=terf_stab1,tag=terf_stab1_breach] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s remove terf_stab1_breach",voiceline:'stfr.bct.stab1_restore',level:1,text:'{"text":"Fusion Reactor Stabilizer U Restored!","color":"green"}'}

execute as @s[tag=!terf_stab2,tag=!terf_stab2_breach] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_stab2_breach",voiceline:'stfr.bct.stab2_breach',level:1,text:'{"text":"Fusion Reactor Stabilizer S Failure!","color":"gold"}'}
execute as @s[tag=terf_stab2,tag=terf_stab2_breach] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s remove terf_stab2_breach",voiceline:'stfr.bct.stab2_restore',level:1,text:'{"text":"Fusion Reactor Stabilizer S Restored!","color":"green"}'}

execute as @s[tag=!terf_stab3,tag=!terf_stab3_breach] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_stab3_breach",voiceline:'stfr.bct.stab3_breach',level:1,text:'{"text":"Fusion Reactor Stabilizer E Failure!","color":"gold"}'}
execute as @s[tag=terf_stab3,tag=terf_stab3_breach] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s remove terf_stab3_breach",voiceline:'stfr.bct.stab3_restore',level:1,text:'{"text":"Fusion Reactor Stabilizer E Restored!","color":"green"}'}

execute as @s[tag=!terf_stab4,tag=!terf_stab4_breach] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_stab4_breach",voiceline:'stfr.bct.stab4_breach',level:1,text:'{"text":"Fusion Reactor Stabilizer N Failure!","color":"gold"}'}
execute as @s[tag=terf_stab4,tag=terf_stab4_breach] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s remove terf_stab4_breach",voiceline:'stfr.bct.stab4_restore',level:1,text:'{"text":"Fusion Reactor Stabilizer N Restored!","color":"green"}'}

execute as @s[tag=!terf_stab5,tag=!terf_stab5_breach] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_stab5_breach",voiceline:'stfr.bct.stab5_breach',level:1,text:'{"text":"Fusion Reactor Stabilizer W Failure!","color":"gold"}'}
execute as @s[tag=terf_stab5,tag=terf_stab5_breach] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s remove terf_stab5_breach",voiceline:'stfr.bct.stab5_restore',level:1,text:'{"text":"Fusion Reactor Stabilizer W Restored!","color":"green"}'}

execute as @s[tag=!terf_stab6,tag=!terf_stab6_breach] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_stab6_breach",voiceline:'stfr.bct.stab6_breach',level:1,text:'{"text":"Fusion Reactor Stabilizer D Failure!","color":"gold"}'}
execute as @s[tag=terf_stab6,tag=terf_stab6_breach] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s remove terf_stab6_breach",voiceline:'stfr.bct.stab6_restore',level:1,text:'{"text":"Fusion Reactor Stabilizer D Restored!","color":"green"}'}
