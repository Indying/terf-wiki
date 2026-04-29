scoreboard players add @s terf_data_A 1

execute unless score @s terf_data_A matches 66.. run return fail
$execute as @n[type=item_display,tag=terf_related_$(machine_id),tag=terf_receptacle_$(rid)] positioned ^ ^ ^1 run function terf:entity/receptacle/drop_capsule

scoreboard players set @s terf_data_A 0
