execute if block ~ ~ ~ #terf:noclip run return run tp @s ~ ~ ~
execute if score damage terf_states matches 100.. run return run function terf:entity/vehicle/hoverbike/explode

execute facing entity @n[type=interaction,tag=terf_currententity] feet rotated ~ ~180 run function terf:entity/vehicle/hoverbike/collision_backtrace

scoreboard players set @s terf_data_Y 0
