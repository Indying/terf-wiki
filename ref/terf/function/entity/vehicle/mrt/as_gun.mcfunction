#terf_data_A = ammo
#terf_data_B = cooldown for recoil animation
scoreboard players operation ammo terf_states = @s terf_data_A

function terf:entity/vehicle/mrt/rotate with storage terf:temp args

execute unless score @s terf_data_B matches 1.. run return fail
scoreboard players remove @s terf_data_B 1
execute if score @s terf_data_B matches 1 run data merge entity @s {interpolation_duration:2,start_interpolation:0,transformation:{translation:[0f,0f,0f]}}
