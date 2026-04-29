particle flame ^1 ^.9 ^-.5 ^ ^ ^10000000000 0.000000000003 0 force
playsound crr:crr.machine6 master @a[distance=0..] ~ ~ ~ 1 2
scoreboard players remove @s terf_data_A 1
execute if score @s terf_data_A matches ..0 positioned ^1 ^1 ^ run return run function terf:entity/machines/extrusion_press/complete with entity @s data.terf
scoreboard players remove @s datapipes_lib_power_storage 8
