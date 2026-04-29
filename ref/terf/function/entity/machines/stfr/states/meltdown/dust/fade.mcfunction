execute if predicate datapipes_lib:chances/50 run scoreboard players remove @s terf_data_A 1

scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players add temp terf_states 150
execute if score temp terf_states matches ..24 run return run kill @s
execute if score @s terf_data_A matches ..0 store result entity @s text_opacity int 1 run scoreboard players get temp terf_states
