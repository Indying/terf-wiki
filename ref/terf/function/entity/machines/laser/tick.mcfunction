#terf_data_A = power
tag @s add terf_laser

tag @s remove datapipes_lib_power_consumer
execute unless block ~ ~1 ~ minecraft:waxed_copper_bulb[lit=true] run return run execute if score @s terf_data_A matches 1.. run scoreboard players remove @s terf_data_A 1

tag @s add datapipes_lib_power_consumer

scoreboard players set power terf_states 0
execute positioned ^1 ^ ^ if block ~ ~ ~ minecraft:acacia_wall_sign run function terf:entity/machines/laser/check_screen
execute positioned ^-1 ^ ^ if block ~ ~ ~ minecraft:acacia_wall_sign run function terf:entity/machines/laser/check_screen
execute if score power terf_states matches ..-1 run scoreboard players set power terf_states 0
scoreboard players operation @s datapipes_lib_power_storage -= power terf_states
execute if score @s datapipes_lib_power_storage matches ..-1 run scoreboard players set @s datapipes_lib_power_storage 0

scoreboard players operation @s datapipes_lib_power_max = power terf_states
scoreboard players operation @s datapipes_lib_power_max *= 100 terf_states

execute if score power terf_states < @s terf_data_A run scoreboard players remove @s terf_data_A 1
execute if score power terf_states > @s terf_data_A run scoreboard players add @s terf_data_A 1
scoreboard players operation power terf_states = @s terf_data_A

scoreboard players set terminated terf_states 200

scoreboard players set axis terf_states 3
execute if data entity @s {Rotation:[270.0f,0.0f]} run scoreboard players set axis terf_states 1
execute if data entity @s {Rotation:[90.0f,0.0f]} run scoreboard players set axis terf_states 1
execute if data entity @s {Rotation:[180.0f,0.0f]} run scoreboard players set axis terf_states 3

data modify storage terf:temp args set value {r:0,g:0,b:1}
execute store result storage terf:temp args.dmg float 0.01 run scoreboard players get power terf_states
execute if score @s datapipes_lib_power_storage >= power terf_states positioned ^ ^1 ^2 run function terf:entity/machines/laser/beam/step with storage terf:temp args

