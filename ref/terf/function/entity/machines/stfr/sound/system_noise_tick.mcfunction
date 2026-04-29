scoreboard players add @s terf_data_C 1
execute if score @s terf_data_C matches 1 run playsound terf:reactorsystemnoise ambient @a[distance=0..] ~ ~ ~ 3 1
execute if score @s terf_data_C matches 160.. run scoreboard players set @s terf_data_C 0