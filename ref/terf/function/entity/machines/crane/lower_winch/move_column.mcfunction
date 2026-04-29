execute positioned ~ ~-1 ~ if block ~ ~ ~ #terf:crane_liftable run function terf:entity/machines/crane/lower_winch/move_column
scoreboard players set rod_activated terf_states 1
execute if block ~ ~ ~ minecraft:purple_glazed_terracotta[facing=south] positioned ~ ~-1 ~ if block ~ ~ ~ #terf:fission_fuel_rod run function terf:entity/machines/crane/lower_winch/deactivate_bottom_rod
execute if score rod_activated terf_states matches 0 run setblock ~ ~ ~ air
execute if block ~ ~-1 ~ #terf:air_and_water rotated 0 90 run function terf:entity/machines/crane/move_block