execute store result score temp terf_states run data get storage terf:temp args.array[0].pos[1] 2
scoreboard players remove temp terf_states 2
execute if block ~ ~ ~ #terf:interactables[powered=true] run scoreboard players operation @s terf_data_A = temp terf_states