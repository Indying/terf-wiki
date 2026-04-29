execute store result score temp terf_states run random value 0..50
scoreboard players operation @s terf_data_A += temp terf_states

scoreboard players add @s terf_data_Y 200

data modify storage terf:temp args set value {arg1:'data modify entity @s text set value {"text":"\\ueff5","color":"#',arg5:'"}'}
execute store result score temp terf_states run random value 0..80
execute store result storage terf:temp args.r int 1 run scoreboard players get temp terf_states
execute store result storage terf:temp args.b int 1 run scoreboard players get temp terf_states
execute store result storage terf:temp args.g int 1 run scoreboard players get temp terf_states
function terf:require/insert_hex_rgb with storage terf:temp args

tag @s remove terf_random_col