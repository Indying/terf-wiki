scoreboard players set succeeded terf_states 0
execute on vehicle as @s[tag=terf_nuke_active] run scoreboard players set succeeded terf_states 1
execute if score succeeded terf_states matches 1 run function terf:entity/nuke/show_time
execute if score succeeded terf_states matches 0 run function terf:entity/nuke/add_time