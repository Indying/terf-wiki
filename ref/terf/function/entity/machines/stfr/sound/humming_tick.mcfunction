#scoreboard players operation temp terf_states = core_temp_divided terf_states
#scoreboard players operation temp terf_states /= 2000 terf_states

#scoreboard players set temp3 terf_states 100
#scoreboard players operation temp3 terf_states -= temp terf_states
#execute if score temp3 terf_states matches ..2 run scoreboard players set temp3 terf_states 1

#scoreboard players add @s terf_data_Ae 1
#execute if score @s terf_data_Ae > temp3 terf_states run function terf:entity/machines/stfr/sound/humming
function terf:entity/machines/stfr/sound/humming