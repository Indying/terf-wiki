execute if block ^ ^ ^-1 minecraft:dispenser run clone ~ ~ ~ ~ ~ ~ ^ ^ ^-2 replace move
execute unless block ^ ^ ^-1 minecraft:dispenser run function terf:entity/machines/crane/move_block_back

execute positioned ^ ^ ^1 unless block ~ ~ ~ waxed_lightning_rod unless block ~ ~ ~ slime_block run return run function terf:entity/machines/multi_piston/retract
execute positioned ^ ^ ^1 unless block ~ ~ ~ waxed_lightning_rod if block ~ ~ ~ slime_block run function terf:entity/machines/multi_piston/retract_frame

execute positioned ^ ^ ^1 if block ~ ~ ~ waxed_lightning_rod run function terf:entity/machines/multi_piston/retract_rod