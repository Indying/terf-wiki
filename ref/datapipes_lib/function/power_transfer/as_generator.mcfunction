execute if entity @s[tag=datapipes_lib_alreadyconnected] run return fail

tag @s add datapipes_lib_alreadyconnected
scoreboard players operation total_net_power datapipes_lib = @s datapipes_lib_power_storage
scoreboard players set @s datapipes_lib_power_storage 0
tag @s add datapipes_lib_current_generators

$execute positioned $(outpos) run function datapipes_lib:require/pipe_presets/wire/pipes_on
execute as @e[type=marker,tag=datapipes_lib_power_generator,tag=!datapipes_lib_alreadyconnected,scores={datapipes_lib_power_storage=1..},sort=nearest,distance=..2048] at @s run function datapipes_lib:power_transfer/generator_connected with entity @s data.power
execute as @e[type=marker,tag=datapipes_lib_power_consumer,tag=!datapipes_lib_alreadyconnected,sort=nearest,distance=..2048] unless score @s datapipes_lib_power_storage >= @s datapipes_lib_power_max at @s run function datapipes_lib:power_transfer/consumer_connected with entity @s data.power
execute if score total_net_power datapipes_lib matches 1.. as @e[type=marker,tag=datapipes_lib_power_generator,tag=datapipes_lib_power_consumer,tag=datapipes_lib_current_generators,sort=nearest,distance=..2048] unless score @s datapipes_lib_power_storage >= @s datapipes_lib_power_max at @s run function datapipes_lib:power_transfer/consumer_connected with entity @s data.power
execute if score total_net_power datapipes_lib matches 1.. as @e[type=marker,tag=datapipes_lib_power_generator,tag=datapipes_lib_current_generators,sort=nearest,distance=..2048] at @s run function datapipes_lib:power_transfer/consumer_connected with entity @s data.power

tag @e[type=minecraft:marker,tag=datapipes_lib_current_generators,distance=..2048] remove datapipes_lib_current_generators

$execute positioned $(outpos) run function datapipes_lib:require/pipe_presets/wire/pipes_off
