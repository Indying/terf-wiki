scoreboard players operation temp terf_states = @s terf_data_T
scoreboard players add temp terf_states 7
scoreboard players operation temp terf_states %= 24 terf_states
execute if score temp terf_states matches 2 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.pling record @a[distance=0..] ~ ~ ~ 1 2
execute if score temp terf_states matches 6 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.pling record @a[distance=0..] ~ ~ ~ 1 2
execute if score temp terf_states matches 10 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.pling record @a[distance=0..] ~ ~ ~ 1 2
execute if score temp terf_states matches 14 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.pling record @a[distance=0..] ~ ~ ~ 1 2

execute if score temp terf_states matches ..12 run data modify storage terf:temp displays.group_main[13].messages[2][0].color set value "#FFCCCD"
