scoreboard players remove terminated terf_states 1
particle reverse_portal ^ ^ ^0.1 ^ ^ ^10000000000 0.0000000001 0 force
execute if score terminated terf_states matches 1.. rotated ~0.1 ~1 run function terf:entity/ender_pearl/raycast