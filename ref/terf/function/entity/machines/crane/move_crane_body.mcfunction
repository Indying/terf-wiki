execute unless block ^ ^ ^1 #terf:air_and_water run scoreboard players set terminated terf_states 1
execute positioned ~ ~-1 ~ if block ~ ~ ~ hopper run function terf:entity/machines/crane/move_winch
execute positioned ^1 ^ ^ if block ~ ~ ~ #terf:crane_blocks run function terf:entity/machines/crane/move_crane_body
execute positioned ~ ~-1 ~ if block ~ ~ ~ #terf:crane_blocks run function terf:entity/machines/crane/move_crane_body

execute if score terminated terf_states matches 0 run clone ~ ~ ~ ~ ~ ~ ^ ^ ^1 replace move