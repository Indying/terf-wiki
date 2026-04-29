scoreboard players operation temp terf_states = @s terf_data_I

scoreboard players operation temp4 terf_states = temp terf_states
scoreboard players operation temp4 terf_states /= 10 terf_states

	scoreboard players operation temp2 terf_states = temp4 terf_states
	scoreboard players operation temp2 terf_states /= 10 terf_states
	scoreboard players operation temp2 terf_states %= 10 terf_states

scoreboard players operation temp4 terf_states %= 10 terf_states

scoreboard players operation temp terf_states /= 1000 terf_states

scoreboard players operation temp3 terf_states = @s terf_data_A

title @s actionbar [{"text":"Dose: ","color":"yellow"},{"score":{"objective":"terf_states","name":"temp"},"color":"gold"},{"text":".","color":"gold"},{"score":{"objective":"terf_states","name":"temp2"},"color":"gold"},{"score":{"objective":"terf_states","name":"temp4"},"color":"gold"},{"text":"mSv | ","color":"yellow"},{"score":{"objective":"terf_states","name":"temp3"},"color":"aqua"},{"text":"μSv/t","color":"blue"}]
