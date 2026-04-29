execute if block ~ ~1 ~ #terf:air_and_water rotated 0 -90 run function terf:entity/machines/crane/move_block
execute if block ~ ~1 ~ purple_glazed_terracotta if block ~ ~-1 ~ light_blue_glazed_terracotta run return fail
execute if block ~ ~1 ~ minecraft:purple_glazed_terracotta positioned ~ ~-1 ~ if block ~ ~ ~ #terf:fission_fuel_rod run function terf:entity/machines/crane/raise_winch/activate_bottom_rod
execute if score rod_activated terf_states matches 1 run return run setblock ~ ~ ~ minecraft:purple_glazed_terracotta[facing=south]
execute positioned ~ ~-1 ~ if block ~ ~ ~ #terf:crane_liftable run function terf:entity/machines/crane/raise_winch/move_column