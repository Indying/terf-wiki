scoreboard players remove @s datapipes_lib_power_storage 10
particle minecraft:crit ^ ^1.2 ^ 0.2 0 0.2 0.1 4 force
scoreboard players remove @s terf_data_A 1
playsound terf:switch master @a[distance=0..] ~ ~ ~ 1 0
execute if score @s terf_data_A matches ..0 positioned ~ ~1.5 ~ run function terf:entity/machines/crusher/complete with entity @s data.terf.stored_recipe 