scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players operation temp terf_states %= 7 terf_states
execute if score temp terf_states matches 3 run playsound terf:alarms.alarm2 master @a[distance=0..] ~ ~ ~ 1 2
