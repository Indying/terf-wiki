execute if block ~ ~ ~ #terf:unpushable run return run scoreboard players set terminated terf_states -1
scoreboard players add temp terf_states 1
execute if score temp terf_states > multi_piston_push_limit terf_states run return run scoreboard players set terminated terf_states -1
execute positioned ^ ^ ^1 unless block ~ ~ ~ #terf:air_and_water run function terf:entity/machines/multi_piston/push
execute if score terminated terf_states matches 0.. run function terf:entity/machines/crane/move_block