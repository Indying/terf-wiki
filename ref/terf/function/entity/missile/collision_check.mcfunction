scoreboard players remove speed_sum terf_states 100000
execute unless block ~ ~ ~ air run return run function terf:entity/missile/he_explode
execute if score speed_sum terf_states matches 100000.. positioned ^ ^ ^1 run function terf:entity/missile/collision_check