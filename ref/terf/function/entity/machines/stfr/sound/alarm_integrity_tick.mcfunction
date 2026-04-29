scoreboard players operation temp terf_states = @s terf_data_T
scoreboard players add temp terf_states 23
scoreboard players operation temp terf_states %= 40 terf_states
execute if score temp terf_states matches 0 as @s[tag=terf_speakerconnected] run playsound terf:alarms.alarm record @a[distance=0..] ~ ~ ~ 8 1

scoreboard players operation temp terf_states %= 8 terf_states
execute if score temp terf_states matches ..4 run data modify storage terf:temp displays.group_main[14].messages[3][0].color set value "red"
execute if score temp terf_states matches 5.. run data modify storage terf:temp displays.group_main[14].messages[3][0].color set value "yellow"