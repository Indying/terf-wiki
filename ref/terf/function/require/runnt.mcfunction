scoreboard players remove run_n_times terf_states 1
$execute if score run_n_times terf_states matches 1.. run function terf:require/runnt {command:'$(command)'}
$$(command)