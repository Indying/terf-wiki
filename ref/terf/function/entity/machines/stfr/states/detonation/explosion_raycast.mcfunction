execute if block ~ ~ ~ air positioned ^ ^ ^1 run return run function terf:entity/machines/stfr/states/detonation/explosion_raycast
execute if block ~ ~ ~ #terf:indestructible run return fail
execute if block ~ ~ ~ lava if block ~ ~-1 ~ bedrock run return fail

execute if score temp terf_states < stfr_max_explosions_per_tick terf_states unless block ~ ~ ~ minecraft:light[level=1] positioned ^ ^ ^-1 run function terf:entity/machines/stfr/states/detonation/explode
