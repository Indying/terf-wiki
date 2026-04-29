execute if score x1 terf_states matches ..-1 if score z1 terf_states matches ..-1 if score x1 terf_states > z1 terf_states run return run scoreboard players operation x1 terf_states = z1 terf_states
execute if score x1 terf_states matches ..-1 if score z1 terf_states matches ..-1 if score x1 terf_states < z1 terf_states run return run scoreboard players operation z1 terf_states = x1 terf_states

execute if score x1 terf_states matches 1.. if score z1 terf_states matches 1.. if score x1 terf_states < z1 terf_states run return run scoreboard players operation x1 terf_states = z1 terf_states
execute if score x1 terf_states matches 1.. if score z1 terf_states matches 1.. if score x1 terf_states > z1 terf_states run return run scoreboard players operation z1 terf_states = x1 terf_states

scoreboard players operation -x1 terf_states = x1 terf_states
scoreboard players operation -x1 terf_states *= -1 terf_states
scoreboard players operation -z1 terf_states = z1 terf_states
scoreboard players operation -z1 terf_states *= -1 terf_states

execute if score x1 terf_states matches 1.. if score z1 terf_states matches ..-1 if score x1 terf_states < -z1 terf_states run return run scoreboard players operation x1 terf_states = -z1 terf_states
execute if score x1 terf_states matches 1.. if score z1 terf_states matches ..-1 if score x1 terf_states > -z1 terf_states run return run scoreboard players operation z1 terf_states = -x1 terf_states

execute if score x1 terf_states matches ..-1 if score z1 terf_states matches 1.. if score x1 terf_states > -z1 terf_states run return run scoreboard players operation x1 terf_states = -z1 terf_states
execute if score x1 terf_states matches ..-1 if score z1 terf_states matches 1.. if score x1 terf_states < -z1 terf_states run return run scoreboard players operation z1 terf_states = -x1 terf_states
