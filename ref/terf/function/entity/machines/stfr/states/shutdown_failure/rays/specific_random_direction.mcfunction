execute store result storage terf:temp args.x float 0.001 run random value -1000..1000
execute store result storage terf:temp args.y float 0.001 run random value -1000..1000
execute summon item_display run function terf:entity/machines/stfr/states/shutdown_failure/rays/specific_random_direction_args with storage terf:temp args

scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches 1.. run function terf:entity/machines/stfr/states/shutdown_failure/rays/specific_random_direction
