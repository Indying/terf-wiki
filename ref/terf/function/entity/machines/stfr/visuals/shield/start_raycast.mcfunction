scoreboard players set core_shield_limit terf_states 1
scoreboard players add @s terf_data_D 1

execute store result storage terf:temp args.core_scale float 0.012 run scoreboard players get core_scale terf_states

execute if score @s terf_data_D matches 1 rotated 0 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 2 rotated 99 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 3 rotated 18 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 4 rotated 117 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 5 rotated 36 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 6 rotated 135 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 7 rotated 54 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 8 rotated 153 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 9 rotated 72 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 10 rotated 171 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 11 rotated 90 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 12 rotated 9 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 13 rotated 108 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 14 rotated 27 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 15 rotated 108 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 16 rotated 45 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 17 rotated 117 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 18 rotated 63 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 19 rotated 135 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 20 rotated 81 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 21 rotated 153 0 run return run function terf:entity/machines/stfr/visuals/shield/raycast with storage terf:temp args
execute if score @s terf_data_D matches 21.. run scoreboard players set @s terf_data_D 0