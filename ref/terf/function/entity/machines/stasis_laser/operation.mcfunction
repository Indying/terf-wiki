scoreboard players add @s terf_data_A 1
$execute if score @s terf_data_A matches 3 run data merge entity @n[type=block_display,tag=terf_related_$(machine_id)] {interpolation_duration:5,transformation:{translation:[0.01f,1.01f,0.01f],scale:[0.98f,0.98f,0.98f]}}

execute if score @s terf_data_A matches 3..40 run function terf:require/play_with_random_pitch {s:'minecraft:block.piston.contract master @a[distance=0..] ~ ~ ~ 0.5',min:5000,max:8000}

scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players operation temp terf_states %= 8 terf_states
$execute at @e[type=marker,tag=terf_related_$(machine_id),limit=1] run function terf:entity/machines/stasis_laser/at_laser_marker

scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players operation temp terf_states %= 5 terf_states

execute if score @s terf_data_A matches ..99 run return run execute if score temp terf_states matches 0 run data modify block ^ ^2 ^2 front_text.messages[0].extra append value "."
execute if score @s terf_data_A matches 100 run function terf:entity/machines/stasis_laser/fire with entity @s data.terf

