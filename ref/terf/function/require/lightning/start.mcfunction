scoreboard players set pitch terf_states 0
scoreboard players set yaw terf_states 0
scoreboard players set terminated terf_states 40
function terf:require/lightning/step with storage terf:temp args
execute as @e[type=minecraft:item_display,tag=terf_lightning] at @s run tp @s ~ ~ ~