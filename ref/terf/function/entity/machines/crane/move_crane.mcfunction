scoreboard players set terminated terf_states 0
execute unless block ~ ~1 ~ #terf:crane_blocks run return fail
execute if block ^ ^1 ^1 #terf:air_and_water positioned ~ ~1 ~ run return run function terf:entity/machines/crane/execute_at_rightmost
function terf:entity/machines/crane/move_winch