scoreboard players operation temp terf_states = @s terf_data_T
scoreboard players operation temp terf_states %= 20 terf_states
execute if score temp terf_states matches 2 as @s[tag=terf_speakerconnected] run playsound terf:alarms.alarm3 record @a[distance=0..] ~ ~ ~ 1 2
execute if score temp terf_states matches 2 as @s[tag=terf_speakerconnected] run playsound terf:alarms.alarm3 record @a[distance=0..] ~ ~ ~ 1 1.97
execute if score temp terf_states matches 8 as @s[tag=terf_speakerconnected] run playsound terf:alarms.alarm3 record @a[distance=0..] ~ ~ ~ 1 2
execute if score temp terf_states matches 8 as @s[tag=terf_speakerconnected] run playsound terf:alarms.alarm3 record @a[distance=0..] ~ ~ ~ 1 1.97

execute if score temp terf_states matches ..6 run data modify storage terf:temp displays.group_main[14].messages[1][0].color set value "yellow"
execute if score temp terf_states matches 7.. run data modify storage terf:temp displays.group_main[14].messages[1][0].color set value "red"
