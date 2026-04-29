execute if block ~ ~ ~ minecraft:iron_chain positioned ~ ~-1 ~ run function terf:entity/machines/crane/lower_winch/lower
execute if block ~ ~ ~ #terf:crane_liftable run function terf:entity/machines/crane/lower_winch/move_column
execute if block ~ ~ ~ #terf:air_and_water run function terf:entity/machines/crane/lower_winch/setblock_chain