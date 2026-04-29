execute if block ~ ~ ~ iron_chain unless block ~ ~-1 ~ iron_chain run function terf:entity/machines/crane/raise_winch/remove_chain
execute positioned ~ ~-1 ~ if block ~ ~ ~ #terf:crane_liftable run function terf:entity/machines/crane/raise_winch/move_column
execute if block ~ ~ ~ minecraft:iron_chain positioned ~ ~-1 ~ run function terf:entity/machines/crane/raise_winch/raise