scoreboard players remove @s terf_data_R 1
execute if score @s terf_data_R matches ..500 if predicate datapipes_lib:chances/60 run return fail
execute if score @s terf_data_R matches ..400 if predicate datapipes_lib:chances/60 run return fail
execute if score @s terf_data_R matches ..300 if predicate datapipes_lib:chances/60 run return fail
execute if score @s terf_data_R matches ..200 if predicate datapipes_lib:chances/60 run return fail
execute if score @s terf_data_R matches ..100 if predicate datapipes_lib:chances/60 run return fail

particle minecraft:block{block_state:red_concrete} ~ ~1 ~ 0.1 0.3 0.1 0 1 force
damage @s 0.5 terf:bleeding
