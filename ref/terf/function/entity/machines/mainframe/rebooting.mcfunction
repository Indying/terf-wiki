execute if score @s terf_data_G matches 1300 run playsound terf:alarms.systemoverheat master @a[distance=0..] ~ ~ ~ 8 1
execute if score @s terf_data_G matches 1160 run playsound terf:lightsswitch master @a[distance=0..] ~ ~ ~ 8 0.8
execute if score @s terf_data_G matches 1140 run playsound terf:alarms.alarm2 master @a[distance=0..] ~ ~ ~ 8 1
execute if score @s terf_data_G matches 1160..1300 if predicate datapipes_lib:chances/50 run data merge block ^-1 ^2 ^1 {front_text:{color:"gray"}}
execute if score @s terf_data_G matches 1160..1300 if predicate datapipes_lib:chances/50 run data merge block ^ ^2 ^1 {front_text:{color:"gray"}}
execute if score @s terf_data_G matches 1160..1300 if predicate datapipes_lib:chances/50 run data merge block ^1 ^2 ^1 {front_text:{color:"gray"}}

execute if score @s terf_data_G matches ..1160 run data merge block ^-1 ^2 ^1 {front_text:{color:"white",messages:["","","",""],has_glowing_text:1b},is_waxed:1b}
execute if score @s terf_data_G matches ..1160 run data merge block ^ ^2 ^1 {front_text:{color:"white",messages:["","","",""],has_glowing_text:1b},is_waxed:1b}
execute if score @s terf_data_G matches ..1160 run data merge block ^1 ^2 ^1 {front_text:{color:"white",messages:["","","",""],has_glowing_text:1b},is_waxed:1b}

execute if score @s terf_data_G matches 1 if score @s terf_data_A < @s terf_data_F run return fail

execute if score @s terf_data_G matches 1 run playsound terf:lightsswitch master @a[distance=0..] ~ ~ ~ 8 1
scoreboard players remove @s terf_data_G 1
