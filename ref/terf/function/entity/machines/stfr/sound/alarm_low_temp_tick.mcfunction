scoreboard players operation temp terf_states = @s terf_data_T
scoreboard players add temp terf_states 7
scoreboard players operation temp terf_states %= 80 terf_states
execute if score temp terf_states matches 0 as @s[tag=terf_speakerconnected] run playsound terf:alarms.alarm3 ambient @a[distance=0..] ~ ~ ~ 8 0.9
execute if score temp terf_states matches 20 as @s[tag=terf_speakerconnected] run playsound terf:alarms.alarm3 ambient @a[distance=0..] ~ ~ ~ 8 0.9
execute if score temp terf_states matches 40 as @s[tag=terf_speakerconnected] run playsound terf:alarms.alarm3 ambient @a[distance=0..] ~ ~ ~ 8 0.9

scoreboard players operation temp terf_states = @s terf_data_T
scoreboard players operation temp terf_states %= 30 terf_states
execute if score temp terf_states matches ..15 run data modify storage terf:temp displays.group_main[13].messages[2][0].color set value "aqua"
