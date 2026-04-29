#fail if theres no capsule
execute unless score @s terf_data_A matches 33 run return fail

playsound terf:slide_out master @a[distance=0..] ~ ~ ~ 1 1
$data merge entity @n[type=item_display,tag=terf_related_$(machine_id),tag=terf_receptacle_$(rid)] {transformation:{translation:[0f,0f,1f]},interpolation_duration:33}
scoreboard players add @s terf_data_A 1
scoreboard players set receptacle_tick terf_states 32