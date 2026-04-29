execute store result storage terf:temp args.1 int 0.1 run scoreboard players get temp terf_states

scoreboard players operation temp terf_states %= 10 terf_states
execute store result storage terf:temp args.2 int 1 run scoreboard players get temp terf_states

data modify storage terf:temp args.color set value "FFBB33"
execute if score @s terf_data_O matches ..300 run data modify storage terf:temp args.color set value "FF0000"
execute if score @s terf_data_O matches ..200 if score ETratetimer terf_states matches 5.. run data modify storage terf:temp args.color set value "FFFF00"
execute as @s[tag=terf_in_air] run data modify storage terf:temp args.color set value "00FF00"

function terf:entity/player/oxygen/display_args with storage terf:temp args
