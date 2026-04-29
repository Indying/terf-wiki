scoreboard players operation seconds terf_states = temp terf_states
scoreboard players operation seconds terf_states /= 20 terf_states

scoreboard players operation minutes terf_states = seconds terf_states
scoreboard players operation minutes terf_states /= 60 terf_states

scoreboard players operation hours terf_states = minutes terf_states
scoreboard players operation hours terf_states /= 60 terf_states

scoreboard players operation minutes terf_states %= 60 terf_states
scoreboard players operation seconds terf_states %= 60 terf_states

scoreboard players reset seconds0 terf_states
scoreboard players reset minutes0 terf_states
execute if score minutes terf_states matches ..9 run scoreboard players set minutes0 terf_states 0
execute if score seconds terf_states matches ..9 run scoreboard players set seconds0 terf_states 0
