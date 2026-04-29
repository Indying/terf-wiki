scoreboard players remove @s datapipes_lib_power_storage 6
particle minecraft:crit ^ ^1.5 ^ 0.2 0 0.2 0.1 4 force
scoreboard players add @s terf_data_A 1
playsound terf:spotlight2 master @a[distance=0..] ~ ~ ~ 1 0
execute if score @s terf_data_A matches 100.. positioned ~ ~1.5 ~ run function terf:entity/machines/wet_mill/complete with entity @s data.terf.stored_recipe 