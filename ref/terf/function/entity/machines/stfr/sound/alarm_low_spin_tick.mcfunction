scoreboard players operation temp terf_states = @s terf_data_T
scoreboard players operation temp terf_states %= 24 terf_states
execute if score temp terf_states matches 20 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.guitar record @a[distance=0..] ~ ~ ~ 1 0
execute if score temp terf_states matches 20 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.guitar record @a[distance=0..] ~ ~ ~ 1 0
execute if score temp terf_states matches 20 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.guitar record @a[distance=0..] ~ ~ ~ 1 0
execute if score temp terf_states matches ..20 run data modify storage terf:temp displays.group_main[13].messages[1][0].color set value "#FFCCCD"
