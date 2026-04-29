scoreboard players add raytermination terf_states 1
particle minecraft:end_rod ^ ^ ^5
execute if score raytermination terf_states matches ..200 rotated ~40 ~0.8 run function terf:entity/machines/stfr/emergency_controls/case_shield/raycast
