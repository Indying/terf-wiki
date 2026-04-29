damage @s 0.3 terf:electron_shockwave at ~ ~ ~

execute unless entity @s[type=marker] run return fail

#effects for all machines
execute at @s run function terf:require/play_with_random_pitch {s:'minecraft:entity.player.attack.crit master @a[distance=0..] ~ ~ ~ 1',min:5000,max:8000}
execute at @s run particle electric_spark ~ ~ ~ 0 0 0 1 100

execute at @s[tag=datapipes_lib_power_generator] if score @s datapipes_lib_power_storage matches 0.. run function terf:entity/explosion/seismic/as_generator with entity @s data.power
execute if score @s datapipes_lib_power_storage matches 0.. run scoreboard players set @s datapipes_lib_power_storage -1000000
data remove entity @s data.terf.security_config

scoreboard players reset @s terf_connected_mainframe
scoreboard players reset @s terf_connected_mainframe_buffer

#effects for each machine
scoreboard players set @s[tag=terf_stfr] terf_data_Ae 1000
execute unless score @s[tag=terf_stfr,tag=terf_core_online] terf_data_Ac matches 1.. run return run scoreboard players set @s terf_data_Ac 1

scoreboard players set @s[tag=terf_warp_core] terf_data_F 0

execute if entity @s[tag=terf_mainframe] unless score @s terf_data_G matches 1.. run return run scoreboard players set @s terf_data_G 1300

scoreboard players set length terf_states 60
execute if score @s[tag=terf_hadron_collider] terf_data_A matches 1.. at @s run function terf:entity/machines/hadron_collider/ring/explosion