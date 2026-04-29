scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches ..-1 run return fail
execute unless block ~ ~-1 ~ #terf:air_and_fire if block ~ ~ ~ air run function terf:entity/orbital_strike/raycast/set_fire

execute if block ~ ~ ~ #terf:air_and_fire positioned ^ ^ ^1 run return run function terf:entity/orbital_strike/raycast/raycast

execute unless block ~ ~ ~ #terf:indestructible unless block ^ ^ ^1 #terf:indestructible unless block ^ ^ ^2 #terf:indestructible unless block ^ ^ ^3 #terf:indestructible unless block ^ ^ ^4 #terf:indestructible unless block ^ ^ ^5 #terf:indestructible unless block ^ ^ ^6 #terf:indestructible unless block ^ ^ ^7 #terf:indestructible unless block ^ ^ ^8 #terf:indestructible run function terf:entity/orbital_strike/raycast/push_block

