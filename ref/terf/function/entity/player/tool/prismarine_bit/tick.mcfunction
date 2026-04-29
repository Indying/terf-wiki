scoreboard players add @s terf_data_A 1
execute unless score @s terf_data_A matches 3.. run return fail

data merge entity @s {start_interpolation:0,transformation:{translation:[0f,0f,0f]}}
function terf:require/play_with_random_pitch {s:'terf:snap block @a[distance=0..] ~ ~ ~ 1',min:8000,max:12000}
tag @s add terf_setup

execute unless block ~ ~ ~ air run return fail
execute align xyz positioned ~ ~-.125 ~ run kill @e[tag=terf_dark_prismarine_bit,dx=0,dy=0,dz=0]
setblock ~ ~ ~ dark_prismarine