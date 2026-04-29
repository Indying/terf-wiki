scoreboard players add raytermination terf_states 1
execute positioned ~-.5 ~-.5 ~-.5 if entity @e[type=minecraft:marker,tag=terf_crane,dx=0,dy=0,dz=0] run return run function terf:entity/player/tool/crane_remote/link
execute positioned ^ ^ ^0.3 if score raytermination terf_states matches ..15 run function terf:entity/player/tool/crane_remote/raycast