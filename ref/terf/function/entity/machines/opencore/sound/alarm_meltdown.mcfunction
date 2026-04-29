scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players operation temp terf_states %= 20 terf_states
execute if score temp terf_states matches 0 run playsound terf:alarms.meltdownsiren master @a[distance=0..] ~ ~ ~ 6 0
execute if score temp terf_states matches 10 run playsound terf:alarms.alarm3 master @a[distance=0..] ~ ~ ~ 2 2
execute if score temp terf_states matches 10 run playsound terf:alarms.alarm3 master @a[distance=0..] ~ ~ ~ 2 2
