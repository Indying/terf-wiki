execute if block ~1 ~ ~ smooth_quartz_slab run scoreboard players set elevator_top terf_states 1
execute if block ~-1 ~ ~ smooth_quartz_slab run scoreboard players set elevator_top terf_states 1
execute if block ~ ~ ~1 smooth_quartz_slab run scoreboard players set elevator_top terf_states 1
execute if block ~ ~ ~-1 smooth_quartz_slab run scoreboard players set elevator_top terf_states 1

execute if block ~1 ~ ~ smooth_quartz_slab[type=bottom] run scoreboard players remove @s terf_data_C 1
execute if block ~-1 ~ ~ smooth_quartz_slab[type=bottom] run scoreboard players remove @s terf_data_C 1
execute if block ~ ~ ~1 smooth_quartz_slab[type=bottom] run scoreboard players remove @s terf_data_C 1
execute if block ~ ~ ~-1 smooth_quartz_slab[type=bottom] run scoreboard players remove @s terf_data_C 1

execute if score elevator_top terf_states matches 0 run scoreboard players remove @s terf_data_C 2

execute if score @s terf_data_C < @s terf_data_A if score terminated terf_states matches 0 if block ~ ~1 ~ #minecraft:stairs if block ~ ~ ~ #minecraft:stairs[facing=south] positioned ~ ~ ~-1 if block ~ ~ ~ smooth_quartz_slab[type=top] run function terf:entity/machines/gear_elevator/connected_top_slabs_up
execute if score @s terf_data_C < @s terf_data_A if score terminated terf_states matches 0 if block ~ ~ ~ #minecraft:stairs[facing=south] positioned ~ ~ ~-1 if block ~ ~ ~ smooth_quartz_slab[type=bottom] run function terf:entity/machines/gear_elevator/connected_bottom_slabs_up
execute if score @s terf_data_C < @s terf_data_A if score terminated terf_states matches 0 if block ~ ~1 ~ #minecraft:stairs if block ~ ~ ~ #minecraft:stairs[facing=north] positioned ~ ~ ~1 if block ~ ~ ~ smooth_quartz_slab[type=top] run function terf:entity/machines/gear_elevator/connected_top_slabs_up
execute if score @s terf_data_C < @s terf_data_A if score terminated terf_states matches 0 if block ~ ~ ~ #minecraft:stairs[facing=north] positioned ~ ~ ~1 if block ~ ~ ~ smooth_quartz_slab[type=bottom] run function terf:entity/machines/gear_elevator/connected_bottom_slabs_up

execute if score @s terf_data_C < @s terf_data_A if score terminated terf_states matches 0 if block ~ ~1 ~ #minecraft:stairs if block ~ ~ ~ #minecraft:stairs[facing=west] positioned ~1 ~ ~ if block ~ ~ ~ smooth_quartz_slab[type=top] run function terf:entity/machines/gear_elevator/connected_top_slabs_up
execute if score @s terf_data_C < @s terf_data_A if score terminated terf_states matches 0 if block ~ ~ ~ #minecraft:stairs[facing=west] positioned ~1 ~ ~ if block ~ ~ ~ smooth_quartz_slab[type=bottom] run function terf:entity/machines/gear_elevator/connected_bottom_slabs_up
execute if score @s terf_data_C < @s terf_data_A if score terminated terf_states matches 0 if block ~ ~1 ~ #minecraft:stairs if block ~ ~ ~ #minecraft:stairs[facing=east] positioned ~-1 ~ ~ if block ~ ~ ~ smooth_quartz_slab[type=top] run function terf:entity/machines/gear_elevator/connected_top_slabs_up
execute if score @s terf_data_C < @s terf_data_A if score terminated terf_states matches 0 if block ~ ~ ~ #minecraft:stairs[facing=east] positioned ~-1 ~ ~ if block ~ ~ ~ smooth_quartz_slab[type=bottom] run function terf:entity/machines/gear_elevator/connected_bottom_slabs_up

execute positioned ~ ~-1 ~ if block ~ ~ ~ #minecraft:stairs run function terf:entity/machines/gear_elevator/rack_top_checks

execute if score @s terf_data_C > @s terf_data_A if score terminated terf_states matches 0 if block ~ ~ ~ #minecraft:stairs[facing=south] positioned ~ ~ ~-1 if block ~ ~ ~ smooth_quartz_slab[type=bottom] run function terf:entity/machines/gear_elevator/connected_bottom_slabs_down
execute if score @s terf_data_C > @s terf_data_A if score terminated terf_states matches 0 if block ~ ~ ~ #minecraft:stairs[facing=south] positioned ~ ~ ~-1 if block ~ ~ ~ smooth_quartz_slab[type=top] run function terf:entity/machines/gear_elevator/connected_top_slabs_down
execute if score @s terf_data_C > @s terf_data_A if score terminated terf_states matches 0 if block ~ ~ ~ #minecraft:stairs[facing=north] positioned ~ ~ ~1 if block ~ ~ ~ smooth_quartz_slab[type=bottom] run function terf:entity/machines/gear_elevator/connected_bottom_slabs_down
execute if score @s terf_data_C > @s terf_data_A if score terminated terf_states matches 0 if block ~ ~ ~ #minecraft:stairs[facing=north] positioned ~ ~ ~1 if block ~ ~ ~ smooth_quartz_slab[type=top] run function terf:entity/machines/gear_elevator/connected_top_slabs_down

execute if score @s terf_data_C > @s terf_data_A if score terminated terf_states matches 0 if block ~ ~ ~ #minecraft:stairs[facing=west] positioned ~1 ~ ~ if block ~ ~ ~ smooth_quartz_slab[type=bottom] run function terf:entity/machines/gear_elevator/connected_bottom_slabs_down
execute if score @s terf_data_C > @s terf_data_A if score terminated terf_states matches 0 if block ~ ~ ~ #minecraft:stairs[facing=west] positioned ~1 ~ ~ if block ~ ~ ~ smooth_quartz_slab[type=top] run function terf:entity/machines/gear_elevator/connected_top_slabs_down
execute if score @s terf_data_C > @s terf_data_A if score terminated terf_states matches 0 if block ~ ~ ~ #minecraft:stairs[facing=east] positioned ~-1 ~ ~ if block ~ ~ ~ smooth_quartz_slab[type=bottom] run function terf:entity/machines/gear_elevator/connected_bottom_slabs_down
execute if score @s terf_data_C > @s terf_data_A if score terminated terf_states matches 0 if block ~ ~ ~ #minecraft:stairs[facing=east] positioned ~-1 ~ ~ if block ~ ~ ~ smooth_quartz_slab[type=top] run function terf:entity/machines/gear_elevator/connected_top_slabs_down
