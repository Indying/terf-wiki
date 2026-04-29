scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches ..0 run return fail

execute positioned ^ ^ ^.1 if block ~ ~ ~ #terf:air_and_moving_piston run return run function terf:entity/player/tool/prismarine_bit/raycast
execute align xyz positioned ~.125 ~ ~.125 run function terf:entity/player/tool/prismarine_bit/place