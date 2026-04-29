execute positioned ~-.5 ~-.5 ~-.5 as @e[dx=1,dy=1,dz=1] run damage @s 50 terf:antimatter_shockwave
scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches ..-1 run return fail
execute if block ~ ~ ~ #terf:air_and_fire positioned ^ ^ ^1 run return run function terf:entity/machines/warp_core/states/detonation/raycast/raycast

execute unless block ~ ~ ~ #terf:indestructible unless block ^ ^ ^1 #terf:indestructible unless block ^ ^ ^2 #terf:indestructible unless block ^ ^ ^3 #terf:indestructible unless block ^ ^ ^4 #terf:indestructible unless block ^ ^ ^5 #terf:indestructible unless block ^ ^ ^6 #terf:indestructible unless block ^ ^ ^7 #terf:indestructible unless block ^ ^ ^8 #terf:indestructible run function terf:entity/machines/warp_core/states/detonation/raycast/push_block

