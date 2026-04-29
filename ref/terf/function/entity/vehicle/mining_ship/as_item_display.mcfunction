#rotation
data modify entity @s Rotation set from storage terf:temp temp

#collision
scoreboard players set collided terf_states 0
execute unless block ^1.65 ^-0.3 ^2.45 #terf:no_collision run scoreboard players set collided terf_states 1
execute unless block ^-1.65 ^-0.3 ^2.45 #terf:no_collision run scoreboard players set collided terf_states 1
execute unless block ^0.5 ^-0.3 ^1 #terf:no_collision run scoreboard players set collided terf_states 1
execute unless block ^-0.5 ^-0.3 ^1 #terf:no_collision run scoreboard players set collided terf_states 1
execute unless block ^ ^-1.2 ^0.6 #terf:no_collision run scoreboard players set collided terf_states 1
execute unless block ^ ^0.5 ^0.6 #terf:no_collision run scoreboard players set collided terf_states 1

#particles
particle minecraft:end_rod ^0.7 ^-0.35 ^-3.75 0 0 0 0 1 force
particle minecraft:end_rod ^-0.7 ^-0.35 ^-3.75 0 0 0 0 1 force
particle minecraft:end_rod ^1 ^-0.35 ^-3.65 0 0 0 0 1 force
particle minecraft:end_rod ^-1 ^-0.35 ^-3.65 0 0 0 0 1 force
particle minecraft:end_rod ^1.9 ^-0.35 ^-2.85 0 0 0 0 1 force
particle minecraft:end_rod ^-1.9 ^-0.35 ^-2.85 0 0 0 0 1 force

#lasers
execute if score left_click terf_states matches 1 if score charge terf_states matches 25.. run function terf:entity/vehicle/mining_ship/laser_shoot