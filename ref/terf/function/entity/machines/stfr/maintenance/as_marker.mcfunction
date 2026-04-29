scoreboard players add @s terf_data_A 1
$$(particle)
execute if block ~ ~ ~ air run kill @s
execute if score @s terf_data_A matches 6000.. run function terf:entity/machines/stfr/maintenance/as_marker_break

scoreboard players set maintenance terf_states 1
execute if score @s terf_data_B matches 0 run return run scoreboard players set case_maintenance terf_states 1
execute if score @s terf_data_B matches 1 run return run scoreboard players set stab_1_maintenance terf_states 1
execute if score @s terf_data_B matches 2 run return run scoreboard players set stab_2_maintenance terf_states 1
execute if score @s terf_data_B matches 3 run return run scoreboard players set stab_3_maintenance terf_states 1
execute if score @s terf_data_B matches 4 run return run scoreboard players set stab_4_maintenance terf_states 1
execute if score @s terf_data_B matches 5 run return run scoreboard players set stab_5_maintenance terf_states 1
execute if score @s terf_data_B matches 6 run scoreboard players set stab_6_maintenance terf_states 1
