$scoreboard players set power terf_states $(power)

#technicals
summon minecraft:marker ~ ~ ~ {Tags:["terf_explosion","terf_antimatter_explosion","terf_currententity"]}
scoreboard players operation @n[type=marker,tag=terf_currententity] terf_data_A = power terf_states
scoreboard players operation @n[type=marker,tag=terf_currententity] terf_data_B = power terf_states
execute store result entity @n[type=marker,tag=terf_currententity] data.terf.power float 1 run scoreboard players get power terf_states
execute store result entity @n[type=marker,tag=terf_currententity] data.terf.volume float 1 run scoreboard players get power terf_states
execute store result entity @n[type=marker,tag=terf_currententity] data.terf.far_volume float 2 run scoreboard players get power terf_states
execute store result entity @n[type=marker,tag=terf_currententity] data.terf.particle_scale float 0.025 run scoreboard players get power terf_states

execute as @n[type=marker,tag=terf_currententity] run function terf:entity/explosion/antimatter/summon_args with entity @s data.terf
