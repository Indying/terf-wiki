#terf_data_A = cooldown
execute unless score @s datapipes_lib_power_storage matches 100.. run return fail

execute if score @s terf_data_A matches 1.. run return run function terf:entity/machines/fabricator/operation
execute if score NETratetimer terf_states >= NETrate terf_states run function terf:entity/machines/fabricator/checks
