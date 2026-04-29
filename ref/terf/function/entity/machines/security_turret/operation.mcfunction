scoreboard players set temp terf_states 32
scoreboard players set temp2 terf_states 0
data modify storage terf:temp temp set from entity @s data.terf.security_config

execute as @a[distance=..32,sort=nearest,scores={terf_data_C=0}] unless predicate terf:has_max_fire_resistance run function terf:entity/machines/security_turret/check_player