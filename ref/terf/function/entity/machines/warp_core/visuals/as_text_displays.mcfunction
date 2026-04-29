execute store result entity @s text_opacity int 1 run scoreboard players get opacity terf_states
data modify entity @s text.color set from storage terf:temp temp
data merge entity @s {start_interpolation:0}
execute if score temp terf_states matches 121 run data modify entity @s interpolation_duration set value 0