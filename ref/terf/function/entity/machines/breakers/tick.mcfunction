scoreboard players operation @s datapipes_lib_power_storage -= @s terf_data_A
execute if score @s[tag=!terf_breaker_activated] datapipes_lib_power_storage matches 1.. run function terf:entity/machines/breakers/check_for_buttons
execute if score @s datapipes_lib_power_storage matches ..-1 run function terf:entity/machines/breakers/turn_off

#slower tick function
execute unless score NETratetimer terf_states >= NETrate terf_states run return fail
scoreboard players set breaker_usage terf_states 0
scoreboard players set breaker_activated terf_states 0
execute if entity @s[tag=terf_breaker_activated] run scoreboard players set breaker_activated terf_states 1
execute positioned ^ ^1 ^ run function datapipes_lib:require/pipe_presets/wire/pipes_on

execute as @e[type=marker,tag=terf_breaker_interested] at @s run function datapipes_lib:require/complex_function/1 with entity @s data.terf.breaker_config

execute if block ^ ^-1 ^ red_glazed_terracotta run function terf:entity/machines/breakers/explode
execute positioned ^ ^1 ^ run function datapipes_lib:require/pipe_presets/wire/pipes_off

#if a machine is connected, set power storage and usage
execute if score breaker_usage terf_states matches 0 run return run function terf:entity/machines/breakers/turn_off
scoreboard players operation @s terf_data_A = breaker_usage terf_states
scoreboard players operation breaker_usage terf_states *= 100 terf_states
scoreboard players operation @s datapipes_lib_power_max = breaker_usage terf_states