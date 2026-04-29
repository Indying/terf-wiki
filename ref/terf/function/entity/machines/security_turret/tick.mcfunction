execute if score NETratetimer terf_states >= NETrate terf_states run function terf:entity/machines/security_turret/slower_tick
execute unless data entity @s data.terf.security_config run return fail
particle minecraft:end_rod ~ ~ ~ 0.1 0.1 0.1 0 1
execute if score ETratetimer terf_states matches 10.. run function terf:entity/machines/security_turret/operation