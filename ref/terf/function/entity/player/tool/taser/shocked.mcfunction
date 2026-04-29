effect give @s minecraft:slowness 3 143 true
effect give @s minecraft:mining_fatigue 10 0 true
effect give @s minecraft:weakness 3 0 true
particle minecraft:electric_spark ~ ~1 ~ 0.2 0.5 0.2 0.1 100 force
playsound minecraft:entity.player.attack.crit player @a[distance=0..] ~ ~ ~ 1 0
playsound minecraft:entity.player.attack.crit player @a[distance=0..] ~ ~ ~ 1 0.6
data remove entity @s data.terf.security_config
scoreboard players reset @s[tag=!terf_stfr] terf_connected_mainframe
scoreboard players reset @s[tag=!terf_stfr] terf_connected_mainframe_buffer
execute unless score @s[tag=terf_mainframe] terf_data_G matches 1.. run scoreboard players set @s terf_data_G 1160
execute unless score @s[tag=terf_stfr] terf_data_Ac matches 1.. if score @s terf_data_A matches 3 run scoreboard players set @s terf_data_Ac 1
execute if score @s[tag=terf_lamp_controller] terf_data_A matches 1 run function terf:entity/machines/lamp_controller/lamps_off_instant
scoreboard players set temp terf_states 0
