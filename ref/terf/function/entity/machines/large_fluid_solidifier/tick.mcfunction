#terf_data_A = progress
execute if score @s terf_data_A matches 1.. run return run function terf:entity/machines/large_fluid_solidifier/operation
execute if score NETratetimer terf_states >= NETrate terf_states run function terf:entity/machines/large_fluid_solidifier/checks
