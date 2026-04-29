$particle minecraft:end_rod ^ ^ ^$(core_scale)
scoreboard players add core_shield_limit terf_states 1
execute if score core_shield_limit terf_states matches ..45 rotated ~ ~-8 run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args