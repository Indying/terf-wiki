scoreboard players operation temp terf_states = @s terf_data_T
scoreboard players operation temp terf_states %= 8 terf_states
execute if score temp terf_states matches 0 as @s[tag=terf_speakerconnected] run playsound terf:alarms.alarm2 ambient @a[distance=0..] ~ ~ ~ 0.4 1.3
execute if score temp terf_states matches 0 as @s[tag=terf_speakerconnected] run playsound terf:alarms.alarm2 ambient @a[distance=0..] ~ ~ ~ 0.4 1.51

scoreboard players operation temp terf_states = @s terf_data_T
scoreboard players operation temp terf_states %= 16 terf_states
execute if score temp terf_states matches ..8 run data modify storage terf:temp displays.group_main[14].messages[2][0].color set value "red"
execute unless score temp terf_states matches ..8 run data modify storage terf:temp displays.group_main[14].messages[2][0].color set value "yellow"

