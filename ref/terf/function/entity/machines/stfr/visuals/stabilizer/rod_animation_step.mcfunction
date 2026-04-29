scoreboard players add @s terf_data_W 1

execute as @s[tag=terf_stab1] rotated 0 -90 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_relative_on
execute as @s[tag=terf_stab2] rotated 0 0 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_relative_on
execute as @s[tag=terf_stab3] rotated 270 0 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_relative_on
execute as @s[tag=terf_stab4] rotated 180 0 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_relative_on
execute as @s[tag=terf_stab5] rotated 90 0 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_relative_on
execute as @s[tag=terf_stab6] rotated 0 90 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_relative_on

execute rotated ~0 0 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_relative_off
execute rotated ~90 0 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_relative_off
execute rotated ~180 0 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_relative_off
execute rotated ~270 0 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_relative_off
execute rotated 0 90 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_relative_off
execute rotated 0 -90 run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_relative_off

execute if score @s terf_data_W matches 10.. run scoreboard players set @s terf_data_W 0