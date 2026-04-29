scoreboard players operation shield_halt_target terf_states = shield_intensity_divided terf_states
scoreboard players operation shield_halt_target terf_states -= 100 terf_states
scoreboard players operation shield_halt_target terf_states /= -5 terf_states
scoreboard players add shield_halt_target terf_states 4
execute as @s[tag=terf_stfr_opshield] run scoreboard players set shield_halt_target terf_states 1
execute if score shield_halt_target terf_states matches ..0 run scoreboard players set shield_halt_target terf_states 1

scoreboard players operation temp terf_states = @s terf_data_T
scoreboard players operation temp terf_states %= shield_halt_target terf_states
execute if score temp terf_states matches 0 if score shield_intensity_divided terf_states matches 1.. positioned ~ ~.2 ~ run function terf:entity/machines/stfr/visuals/shield/start_raycast

execute store result storage terf:temp args.arg2 float 0.011 run scoreboard players get core_scale terf_states

execute positioned ~ ~.15 ~ run function terf:entity/machines/stfr/visuals/shield/start_charge_raycast
