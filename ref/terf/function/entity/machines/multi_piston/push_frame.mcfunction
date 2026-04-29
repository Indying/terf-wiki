scoreboard players set temp terf_states 0
execute positioned ^ ^ ^1 unless block ~ ~ ~ #terf:air_and_water run function terf:entity/machines/multi_piston/push

execute unless score terminated terf_states matches 0.. run return run playsound minecraft:entity.item.break master @a[distance=0..] ~ ~ ~ 1

function terf:entity/machines/crane/move_block
execute positioned ^1 ^ ^ if block ~ ~ ~ slime_block run function terf:entity/machines/multi_piston/push_frame
execute positioned ^-1 ^ ^ if block ~ ~ ~ slime_block run function terf:entity/machines/multi_piston/push_frame
execute positioned ^ ^1 ^ if block ~ ~ ~ slime_block run function terf:entity/machines/multi_piston/push_frame
execute positioned ^ ^-1 ^ if block ~ ~ ~ slime_block run function terf:entity/machines/multi_piston/push_frame