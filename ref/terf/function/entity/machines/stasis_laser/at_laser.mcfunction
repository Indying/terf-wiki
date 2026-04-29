scoreboard players set status terf_states 1

#check the direction the laser is in
execute if block ~-1 ~-1 ~-1 minecraft:glass rotated 180 0 run function terf:entity/machines/stasis_laser/laser_checks
