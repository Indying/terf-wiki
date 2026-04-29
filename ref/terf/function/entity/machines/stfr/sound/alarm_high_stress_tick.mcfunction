scoreboard players operation temp terf_states = @s terf_data_T
scoreboard players operation temp terf_states %= 24 terf_states
execute if score temp terf_states matches 2 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.guitar record @a[distance=0..] ~ ~ ~ 1 2
execute if score temp terf_states matches 6 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.guitar record @a[distance=0..] ~ ~ ~ 1 2
execute if score temp terf_states matches 10 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.guitar record @a[distance=0..] ~ ~ ~ 1 2
execute if score temp terf_states matches 14 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.guitar record @a[distance=0..] ~ ~ ~ 1 2

data modify storage terf:temp displays.group_main[14].messages[3][0].color set value "#FFCCCD"