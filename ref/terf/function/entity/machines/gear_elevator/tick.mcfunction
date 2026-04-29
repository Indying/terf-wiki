scoreboard players remove @s datapipes_lib_power_storage 1
execute if score @s datapipes_lib_power_storage matches ..-1 run return run scoreboard players set @s datapipes_lib_power_storage 0

execute if score @s terf_data_A = @s terf_data_C run return run execute if entity @s[tag=terf_elevator_running] run function terf:entity/machines/gear_elevator/stop

execute if entity @s[tag=!terf_elevator_running] run function terf:entity/machines/gear_elevator/start
scoreboard players add @s terf_data_B 1
execute if score @s terf_data_B matches 2.. run function terf:entity/machines/gear_elevator/slower_tick
