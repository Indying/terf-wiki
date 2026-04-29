scoreboard players operation temp terf_states = @s terf_data_T
scoreboard players add temp terf_states 5
scoreboard players operation temp terf_states %= 60 terf_states
execute if score temp terf_states matches 0 as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep record @a[distance=0..] ^ ^ ^1 8 0.81
execute if score temp terf_states matches 0 as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep record @a[distance=0..] ^ ^ ^1 8 0.8