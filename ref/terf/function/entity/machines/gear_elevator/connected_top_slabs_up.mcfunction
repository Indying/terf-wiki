execute unless block ~ ~1 ~ #minecraft:air run scoreboard players set terminated terf_states 1

execute positioned ~-.5 ~.5 ~-.5 as @e[dx=0,dy=0,dz=0,type=!marker,type=!item_display,type=!text_display,type=!block_display] at @s run function terf:entity/machines/gear_elevator/as_entity {tp:0.5}
#execute positioned ~-.5 ~-.5 ~-.5 as @a[dx=0,dy=0,dz=0] at @s run tp @s ~ ~1.6 ~ might not be needed
#execute positioned ~-.5 ~-1.5 ~-.5 as @a[dx=0,dy=0,dz=0] at @s run tp @s ~ ~3 ~

execute if score terminated terf_states matches 0 run setblock ~ ~1 ~ minecraft:smooth_quartz_slab
execute if score terminated terf_states matches 0 run setblock ~ ~ ~ minecraft:air

execute if score terminated terf_states matches 0 positioned ~ ~ ~1 if block ~ ~ ~ smooth_quartz_slab[type=top] run function terf:entity/machines/gear_elevator/connected_top_slabs_up
execute if score terminated terf_states matches 0 positioned ~ ~ ~-1 if block ~ ~ ~ smooth_quartz_slab[type=top] run function terf:entity/machines/gear_elevator/connected_top_slabs_up
execute if score terminated terf_states matches 0 positioned ~1 ~ ~ if block ~ ~ ~ smooth_quartz_slab[type=top] run function terf:entity/machines/gear_elevator/connected_top_slabs_up
execute if score terminated terf_states matches 0 positioned ~-1 ~ ~ if block ~ ~ ~ smooth_quartz_slab[type=top] run function terf:entity/machines/gear_elevator/connected_top_slabs_up

