execute if block ~ ~ ~ water run setblock ~ ~ ~ air
execute if block ~ ~ ~ #terf:air_and_water positioned ^ ^ ^1 run return run function terf:require/black_hole/raycast
execute unless block ~ ~ ~ #terf:indestructible unless block ^ ^ ^-3 #terf:indestructible run clone ~ ~ ~ ~ ~ ~ ^ ^ ^-3 replace move
