execute if score @s terf_data_A matches 1.. run return run function terf:entity/machines/stasis_laser/operation with entity @s data.terf
execute if block ^ ^ ^2 minecraft:stone_button[powered=true] run return run execute if entity @s[tag=!terf_powered] run function terf:entity/machines/stasis_laser/powered
tag @s remove terf_powered
data merge block ^ ^2 ^2 {is_waxed:1b,front_text:{has_glowing_text:1b,color:white,messages:["Activate Stasis","Laser","|","V"]}}
