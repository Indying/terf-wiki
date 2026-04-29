execute unless block ~ ~1 ~ #minecraft:air run scoreboard players set terminated terf_states 1

execute positioned ~-.5 ~ ~-.5 as @e[dx=0,dy=0,dz=0,type=!marker,type=!item_display,type=!text_display,type=!block_display] at @s run function terf:entity/machines/gear_elevator/as_entity {tp:0.5}

execute if score terminated terf_states matches 0 run setblock ~ ~ ~ minecraft:smooth_quartz_slab[type=top]

execute if score terminated terf_states matches 0 positioned ~ ~ ~1 if block ~ ~ ~ smooth_quartz_slab[type=bottom] run function terf:entity/machines/gear_elevator/connected_bottom_slabs_up
execute if score terminated terf_states matches 0 positioned ~ ~ ~-1 if block ~ ~ ~ smooth_quartz_slab[type=bottom] run function terf:entity/machines/gear_elevator/connected_bottom_slabs_up
execute if score terminated terf_states matches 0 positioned ~1 ~ ~ if block ~ ~ ~ smooth_quartz_slab[type=bottom] run function terf:entity/machines/gear_elevator/connected_bottom_slabs_up
execute if score terminated terf_states matches 0 positioned ~-1 ~ ~ if block ~ ~ ~ smooth_quartz_slab[type=bottom] run function terf:entity/machines/gear_elevator/connected_bottom_slabs_up

