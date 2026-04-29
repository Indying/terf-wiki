scoreboard players add raytermination terf_states 1
execute align xyz positioned ~.5 ~.5 ~.5 if entity @e[type=minecraft:marker,tag=terf_multiblockcore,distance=..1] run function terf:entity/player/tool/linker/apply_to_marker
execute align xyz positioned ~.5 ~ ~.5 if block ~ ~ ~ #terf:interactables run function terf:entity/player/tool/linker/check_block
execute if score raytermination terf_states matches ..40 positioned ^ ^ ^.1 run function terf:entity/player/tool/linker/raycast