scoreboard players operation temp terf_states = @s terf_data_T
scoreboard players add temp terf_states 20
scoreboard players operation temp terf_states %= 50 terf_states
execute if score temp terf_states matches 0 as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep record @a[distance=0..] ^ ^ ^1 8 0.61
execute if score temp terf_states matches 0 as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep record @a[distance=0..] ^ ^ ^1 8 0.6