scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players operation temp terf_states %= 120 terf_states
execute if score temp terf_states matches 66 run playsound terf:opencore.magnet_loop master @a[distance=0..] ~ ~ ~ 2 1