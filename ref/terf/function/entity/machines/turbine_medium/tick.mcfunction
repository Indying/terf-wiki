#do not continue if the entire machine is not loaded
execute unless loaded ~16 ~ ~ run return fail
execute unless loaded ~-16 ~ ~ run return fail
execute unless loaded ~ ~ ~16 run return fail
execute unless loaded ~ ~ ~-16 run return fail
execute unless loaded ~16 ~ ~16 run return fail
execute unless loaded ~-16 ~ ~16 run return fail
execute unless loaded ~16 ~ ~-16 run return fail
execute unless loaded ~-16 ~ ~-16 run return fail

#generate the power
execute if score NETratetimer terf_states >= NETrate terf_states run function terf:entity/machines/turbine_medium/slower_tick
execute if score @s terf_data_A matches 1.. positioned ^ ^ ^4 run playsound terf:machine_hum master @a[distance=0..] ~ ~ ~ 1 1.5
