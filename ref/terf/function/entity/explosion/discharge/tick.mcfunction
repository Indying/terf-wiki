scoreboard players add @s terf_data_A 1

$execute if score @s terf_data_A matches 1 positioned $(x) $(y) $(z) run function terf:entity/explosion/discharge/at_destination
execute if score @s terf_data_A matches 1 run function terf:entity/explosion/discharge/run
execute if score @s terf_data_A matches 1 run title @a[distance=..100,tag=!terf_epilepsy_mode] times 0 2 5
execute if score @s terf_data_A matches 1 run title @a[distance=..100,tag=!terf_epilepsy_mode] title "\ueff4"

$execute if score @s terf_data_A matches 5 run kill @e[type=item_display,tag=$(tag)]
execute if score @s terf_data_A matches 5 run function terf:entity/explosion/discharge/run
execute if score @s terf_data_A matches 5 run title @a[distance=..100,tag=!terf_epilepsy_mode] times 0 0 3
execute if score @s terf_data_A matches 5 run title @a[distance=..100,tag=!terf_epilepsy_mode] title "\ueff4"

$execute if score @s terf_data_A matches 9 run kill @e[type=item_display,tag=$(tag)]
execute if score @s terf_data_A matches 9 run function terf:entity/explosion/discharge/run
execute if score @s terf_data_A matches 9 run title @a[distance=..100,tag=!terf_epilepsy_mode] times 0 0 3
execute if score @s terf_data_A matches 9 run title @a[distance=..100,tag=!terf_epilepsy_mode] title "\ueff4"

$execute if score @s terf_data_A matches 13 run kill @e[type=item_display,tag=$(tag)]
execute if score @s terf_data_A matches 13 run function terf:entity/explosion/discharge/run
execute if score @s terf_data_A matches 13 run title @a[distance=..100,tag=!terf_epilepsy_mode] times 0 0 2
execute if score @s terf_data_A matches 13 run title @a[distance=..100,tag=!terf_epilepsy_mode] title "\ueff4"

$execute if score @s terf_data_A matches 17 run kill @e[type=item_display,tag=$(tag)]
execute if score @s terf_data_A matches 17 run function terf:entity/explosion/discharge/run

$execute if score @s terf_data_A matches 21 run kill @e[type=item_display,tag=$(tag)]
execute if score @s terf_data_A matches 21.. run kill @s
