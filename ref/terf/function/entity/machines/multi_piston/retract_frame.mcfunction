execute unless block ^ ^ ^-1 #terf:air_and_fire run return run playsound minecraft:entity.item.break master @a[distance=0..] ~ ~ ~ 1

function terf:entity/machines/crane/move_block_back

execute positioned ^1 ^ ^ if block ~ ~ ~ slime_block run function terf:entity/machines/multi_piston/retract_frame
execute positioned ^-1 ^ ^ if block ~ ~ ~ slime_block run function terf:entity/machines/multi_piston/retract_frame
execute positioned ^ ^1 ^ if block ~ ~ ~ slime_block run function terf:entity/machines/multi_piston/retract_frame
execute positioned ^ ^-1 ^ if block ~ ~ ~ slime_block run function terf:entity/machines/multi_piston/retract_frame

scoreboard players set temp terf_states 0
execute positioned ^ ^ ^1 run function terf:entity/machines/multi_piston/retract