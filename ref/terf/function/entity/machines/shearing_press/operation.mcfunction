execute if score @s terf_data_A = @s terf_data_B run function terf:entity/machines/shearing_press/args with entity @s data.terf
scoreboard players remove @s terf_data_A 1
execute if score @s terf_data_A matches ..0 positioned ^1 ^1 ^ run return run function terf:entity/machines/shearing_press/complete with entity @s data.terf
scoreboard players remove @s datapipes_lib_power_storage 3
