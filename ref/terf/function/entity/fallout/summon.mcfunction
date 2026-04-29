forceload add ~ ~
summon minecraft:marker ~ ~ ~ {Tags:["terf_fallout","terf_currententity"]}

$scoreboard players set @n[type=minecraft:marker,tag=terf_currententity] terf_data_A $(rad_incr)
$scoreboard players set @n[type=minecraft:marker,tag=terf_currententity] terf_data_B $(rad)
$scoreboard players set @n[type=minecraft:marker,tag=terf_currententity] terf_data_C $(max_rad)
$scoreboard players set @n[type=minecraft:marker,tag=terf_currententity] terf_data_D $(int_div)
$scoreboard players set @n[type=minecraft:marker,tag=terf_currententity] terf_data_E $(rad_decr)

tag @n[tag=terf_currententity] remove terf_currententity