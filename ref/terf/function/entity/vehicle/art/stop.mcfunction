execute if score @s terf_data_A matches 0 run return fail
scoreboard players set @s terf_data_A 0
stopsound @a[distance=..16] * terf:elevator_start
stopsound @a[distance=..272] * terf:charge_up.railguncharging1
playsound terf:elevator_stop ambient @a[distance=0..] ~ ~ ~ 1 0