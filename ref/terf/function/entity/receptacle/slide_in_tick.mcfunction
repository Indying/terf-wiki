scoreboard players add @s terf_data_A 1

execute unless score @s terf_data_A matches 4 run return fail
$data merge entity @n[type=item_display,tag=terf_related_$(machine_id),tag=terf_receptacle_$(rid)] {transformation:{translation:[0f,0f,0f]},interpolation_duration:33}
playsound terf:slide_in master @a[distance=0..] ~ ~ ~ 1 1