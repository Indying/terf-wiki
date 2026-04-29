scoreboard players add temp terf_states 1
execute if score mode terf_states matches 0 run return fail
execute if predicate datapipes_lib:chances/5 run function terf:require/lightning_random {max_splits:100,splitp:'datapipes_lib:chances/60',contp:'datapipes_lib:chances/60'}
execute if predicate datapipes_lib:chances/0.1 unless block ^ ^ ^1 minecraft:orange_glazed_terracotta run function terf:entity/machines/battery_array/explode
