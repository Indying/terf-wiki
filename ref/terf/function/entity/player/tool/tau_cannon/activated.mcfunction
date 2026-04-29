execute if function terf:require/is_item_broken run return 0
execute if function terf:require/is_item_broken_offhand run return 0

tag @s add terf_holding_tau_cannon
scoreboard players add @s terf_data_G 2
execute if score @s terf_data_G matches 360.. run function terf:entity/player/tool/tau_cannon/overload

#sound
execute if score @s terf_data_G matches 3.. run return fail
playsound terf:charge_up.tau_cannon_charge player @a[distance=0.1..] ~ ~ ~ 1 1
playsound terf:charge_up.tau_cannon_charge player @s ~ ~10000000 ~ 10000000 1
