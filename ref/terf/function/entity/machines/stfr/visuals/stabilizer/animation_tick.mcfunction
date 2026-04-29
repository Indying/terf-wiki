execute if score shield_stress terf_states matches ..0 run scoreboard players set stabilizer_a_target terf_states 14
execute if score shield_stress terf_states matches 1..10 run scoreboard players set stabilizer_a_target terf_states 13
execute if score shield_stress terf_states matches 11..20 run scoreboard players set stabilizer_a_target terf_states 12
execute if score shield_stress terf_states matches 21..30 run scoreboard players set stabilizer_a_target terf_states 11
execute if score shield_stress terf_states matches 31..40 run scoreboard players set stabilizer_a_target terf_states 10
execute if score shield_stress terf_states matches 41..50 run scoreboard players set stabilizer_a_target terf_states 9
execute if score shield_stress terf_states matches 51..60 run scoreboard players set stabilizer_a_target terf_states 8
execute if score shield_stress terf_states matches 61..70 run scoreboard players set stabilizer_a_target terf_states 7
execute if score shield_stress terf_states matches 71..80 run scoreboard players set stabilizer_a_target terf_states 6
execute if score shield_stress terf_states matches 81..90 run scoreboard players set stabilizer_a_target terf_states 5
execute if score shield_stress terf_states matches 91..100 run scoreboard players set stabilizer_a_target terf_states 4
execute if score shield_stress terf_states matches 101..110 run scoreboard players set stabilizer_a_target terf_states 3
execute if score shield_stress terf_states matches 111..120 run scoreboard players set stabilizer_a_target terf_states 2
execute if score shield_stress terf_states matches 121.. run scoreboard players set stabilizer_a_target terf_states 1

scoreboard players operation temp terf_states = @s terf_data_T
scoreboard players operation temp terf_states %= stabilizer_a_target terf_states
execute if score temp terf_states matches 0 positioned ~ ~.2 ~ run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step