scoreboard players add terminated terf_states 1
execute align xyz positioned ~.5 ~.5 ~.5 as @e[type=minecraft:marker,distance=..0.6,tag=!terf_multimeter] run return run function terf:entity/player/tool/multimeter/multiblock_core_checks
execute if block ~ ~ ~ white_glazed_terracotta align xyz positioned ~.5 ~.5 ~.5 run return run function terf:entity/player/tool/multimeter/mcfr_checks
execute if block ~ ~ ~ #terf:multimeter_measurable align xyz positioned ~.5 ~.5 ~.5 run return run function terf:entity/player/tool/multimeter/check_cable
execute if score terminated terf_states matches ..80 positioned ^ ^ ^.05 run function terf:entity/player/tool/multimeter/raycast