scoreboard players add tx terf_states 1
execute if score tx terf_states <= x terf_states positioned ~1 ~ ~ run function terf:require/run_spatial/run_x
scoreboard players set ty terf_states 0
function terf:require/run_spatial/run_y