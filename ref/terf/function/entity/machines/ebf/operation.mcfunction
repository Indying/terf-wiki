execute if score @s datapipes_lib_power_storage matches ..99 run return fail
scoreboard players remove @s datapipes_lib_power_storage 100

scoreboard players remove @s terf_data_A 1
playsound minecraft:block.blastfurnace.fire_crackle master @a[distance=0..] ~ ~ ~ 1 2
particle large_smoke ^ ^3 ^-1 0 1 0 0.4 0 force



execute if score @s terf_data_A matches ..0 run function terf:entity/machines/ebf/complete with entity @s data.terf
