scoreboard players operation temp terf_states = @s terf_data_T
scoreboard players add temp terf_states 13
scoreboard players operation temp terf_states %= 24 terf_states
execute if score temp terf_states matches 2 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.pling record @a[distance=0..] ~ ~ ~ 1 1.8
execute if score temp terf_states matches 6 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.pling record @a[distance=0..] ~ ~ ~ 1 1.8
execute if score temp terf_states matches 10 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.pling record @a[distance=0..] ~ ~ ~ 1 1.8
execute if score temp terf_states matches 14 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.pling record @a[distance=0..] ~ ~ ~ 1 1.8

execute if score temp terf_states matches 2 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.pling record @a[distance=0..] ~ ~ ~ 1 1.81
execute if score temp terf_states matches 6 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.pling record @a[distance=0..] ~ ~ ~ 1 1.81
execute if score temp terf_states matches 10 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.pling record @a[distance=0..] ~ ~ ~ 1 1.81
execute if score temp terf_states matches 14 as @s[tag=terf_speakerconnected] run playsound minecraft:block.note_block.pling record @a[distance=0..] ~ ~ ~ 1 1.81
