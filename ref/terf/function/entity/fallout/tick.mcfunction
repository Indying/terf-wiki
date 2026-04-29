#terf_data_A = radius increase per tick
#terf_data_B = current radius in blocks | accuracy:1000
#terf_data_C = max radius in blocks | accuracy:1000, after reaching this the radius and intensity will decrease
#terf_data_D = intensity divider, for the {current radius} skin radiation per tick you get in the center
#terf_data_E = radius decrease after reaching max radius

forceload add ~ ~

execute store result score x terf_states run data get entity @s Pos[0] 100
execute store result score z terf_states run data get entity @s Pos[2] 100
scoreboard players operation radius terf_states = @s terf_data_B
scoreboard players operation radius terf_states /= 10 terf_states
scoreboard players operation intensity_divider terf_states = @s terf_data_D

execute as @a[distance=0..] at @s run function terf:entity/fallout/in_fallout_area

execute if score @s terf_data_B >= @s terf_data_C run tag @s add terf_fallout_decaying
execute unless entity @s[tag=terf_fallout_decaying] run return run scoreboard players operation @s terf_data_B += @s terf_data_A

scoreboard players operation @s terf_data_B -= @s terf_data_E
execute unless score ETratetimer terf_states matches 10 run return fail
scoreboard players add @s terf_data_D 1

execute unless score @s terf_data_B matches ..0 run return fail

kill @s
forceload remove ~ ~