scoreboard players operation temp terf_states = @s terf_data_T
scoreboard players operation temp terf_states %= 40 terf_states
execute if score temp terf_states matches 20 as @s[tag=terf_speakerconnected] run playsound terf:alarms.apcloop ambient @a[distance=0..] ~ ~ ~ 8 1

