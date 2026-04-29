scoreboard players add tz terf_states 1
execute if score tz terf_states <= z terf_states positioned ~ ~ ~1 run function terf:require/run_spatial/run_z with storage terf:temp args
$$(command)