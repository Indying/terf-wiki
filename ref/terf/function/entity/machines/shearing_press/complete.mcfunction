$$(stored_recipe)
scoreboard players set @s terf_data_A 0
playsound terf:fuel_pellet_loading master @a[distance=0..] ~ ~ ~ 1 1
$data merge entity @e[type=block_display,tag=terf_related_$(machine_id),limit=1] {transformation:{translation:[0f,0f,0f]},start_interpolation:0,interpolation_duration:$(Ht)}
execute at @s run function terf:entity/machines/shearing_press/checks
