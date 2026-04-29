scoreboard players operation temp terf_states = @s terf_data_T
scoreboard players operation temp terf_states %= 24 terf_states
execute if score temp terf_states matches 0 as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep3 ambient @a[distance=0..] ~ ~ ~ 8 0