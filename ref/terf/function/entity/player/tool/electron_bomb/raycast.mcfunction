scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches ..0 run return fail
execute positioned ^ ^ ^.1 if block ~ ~ ~ #minecraft:air run return run function terf:entity/player/tool/electron_bomb/raycast

execute align xyz positioned ~.5 ~ ~.5 run function terf:entity/player/tool/electron_bomb/summon
