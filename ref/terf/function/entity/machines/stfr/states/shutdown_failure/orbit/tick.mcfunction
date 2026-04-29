scoreboard players add @s terf_data_A 1
execute if score @s terf_data_A matches 100.. run kill @s

particle end_rod ~ ~ ~ 0 0 0 0 1 force
particle end_rod ^ ^ ^-.2 0 0 0 0 1 force
particle end_rod ^ ^ ^-.4 0 0 0 0 1 force
particle end_rod ^ ^ ^-.6 0 0 0 0 1 force
particle end_rod ^ ^ ^-.8 0 0 0 0 1 force

tp @s ^ ^ ^-1 ~5 ~

execute if block ~ ~ ~ #minecraft:air run return fail
kill @s
particle flash{color:[1,1,1,1]} ~ ~ ~ 0 0 0 0 1 force
