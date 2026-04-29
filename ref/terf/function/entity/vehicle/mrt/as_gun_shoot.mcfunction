#fail if cooldown
execute if score @s terf_data_B matches 1.. run return fail

#fail if no ammo
execute unless score @s terf_data_A matches 1.. run return fail

#rotate the turret in the same tick before shooting so its subtick accurate
scoreboard players set @s terf_data_B 5
execute on vehicle on vehicle on vehicle on vehicle run function terf:entity/vehicle/mrt/tick
execute at @s positioned ^ ^-.5 ^2 run function terf:entity/vehicle/mrt/shoot

