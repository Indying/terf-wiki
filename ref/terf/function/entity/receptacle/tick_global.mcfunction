scoreboard players remove receptacle_tick terf_states 1
execute as @e[type=interaction,tag=terf_receptacle] if score @s terf_data_A matches 1..32 at @s run function terf:entity/receptacle/slide_in_tick with entity @s data.terf
execute as @e[type=interaction,tag=terf_receptacle] if score @s terf_data_A matches 34.. at @s run function terf:entity/receptacle/slide_out_tick with entity @s data.terf
