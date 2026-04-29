scoreboard players add ty terf_states 1
execute if score ty terf_states <= y terf_states positioned ~ ~1 ~ run function terf:require/run_spatial/run_y
scoreboard players set tz terf_states 0
function terf:require/run_spatial/run_z with storage terf:temp args