scoreboard players remove terminated terf_states 1
execute positioned ^ ^ ^.1 if block ~ ~ ~ #minecraft:air if score terminated terf_states matches 1.. run return run function terf:entity/player/tool/fire_extinguisher/place_raycast
execute if score terminated terf_states matches ..0 run return fail
execute align xyz positioned ~.5 ~.5 ~.5 if entity @e[type=item_display,tag=terf_fire_extinguisher,distance=..0.6] run return fail

execute unless block ~ ~ ~ #minecraft:air run return fail
execute unless block ~ ~-1 ~ #minecraft:air align xyz positioned ~.5 ~.5 ~.5 run return run function terf:entity/player/tool/fire_extinguisher/place
execute unless block ~1 ~ ~ #minecraft:air align xyz positioned ~.875 ~.5 ~.5 run return run function terf:entity/player/tool/fire_extinguisher/place
execute unless block ~-1 ~ ~ #minecraft:air align xyz positioned ~.125 ~.5 ~.5 run return run function terf:entity/player/tool/fire_extinguisher/place
execute unless block ~ ~ ~1 #minecraft:air align xyz positioned ~.5 ~.5 ~.875 run return run function terf:entity/player/tool/fire_extinguisher/place
execute unless block ~ ~ ~-1 #minecraft:air align xyz positioned ~.5 ~.5 ~.125 run function terf:entity/player/tool/fire_extinguisher/place
