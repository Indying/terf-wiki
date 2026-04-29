execute if block ~ ~ ~ waxed_lightning_rod positioned ^ ^ ^1 unless block ~ ~ ~ #terf:air_and_water run function terf:entity/machines/multi_piston/push_rod
execute unless block ~ ~ ~ waxed_lightning_rod unless block ~ ~ ~ slime_block run function terf:entity/machines/multi_piston/push
execute unless block ~ ~ ~ waxed_lightning_rod if block ~ ~ ~ slime_block run function terf:entity/machines/multi_piston/push_frame

execute if block ~ ~ ~ waxed_lightning_rod if score terminated terf_states matches 0.. run function terf:entity/machines/crane/move_block