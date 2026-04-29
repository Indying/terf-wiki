scoreboard players add @s[type=player] terf_data_A 10000
scoreboard players add @s[tag=terf_fuel_rod] terf_data_A 10000
$damage @s $(damage) terf:tau_cannon by @a[tag=terf_currententity,limit=1]
tag @s add terf_no_ray_damage
function terf:require/ignite_held_items
