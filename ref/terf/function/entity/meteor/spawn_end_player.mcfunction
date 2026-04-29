scoreboard players set temp terf_states 0
function terf:entity/meteor/spawn_end_player_raycast
execute if score temp terf_states matches 1 run return run function terf:entity/meteor/spawn_end_random

execute if predicate datapipes_lib:chances/1 run function terf:entity/meteor/spawn_end_random
