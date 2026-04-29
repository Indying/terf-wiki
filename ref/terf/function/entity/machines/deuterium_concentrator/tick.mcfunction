execute if score @s terf_data_A matches 1.. run return run function terf:entity/machines/deuterium_concentrator/operation
execute if score NETratetimer terf_states >= NETrate terf_states run function terf:entity/machines/deuterium_concentrator/checks
