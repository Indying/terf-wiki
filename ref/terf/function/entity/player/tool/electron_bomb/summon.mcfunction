playsound minecraft:block.heavy_core.place master @a[distance=0..] ~ ~ ~

#place
summon item_display ~ ~ ~ {Tags:["terf_currententity","terf_electron_bomb"]}
summon marker ~ ~ ~ {Tags:["terf_currententity","terf_electron_bomb","datapipes_lib_power_consumer"],data:{power:{checks:"if block ^ ^ ^1 red_glazed_terracotta"}}}
summon interaction ~ ~ ~ {Tags:["terf_vehicle","terf_currententity","terf_electron_bomb"],response:1b,data:{on_player_hit:"function terf:entity/player/tool/electron_bomb/interaction/hit",on_player_click:"function terf:entity/player/tool/electron_bomb/interaction/clicked"}}
execute as @e[type=!interaction,tag=terf_currententity] run ride @s mount @n[type=minecraft:interaction,tag=terf_currententity]

item replace entity @n[type=item_display,tag=terf_currententity] container.0 from entity @s weapon
item modify entity @s weapon datapipes_lib:decrement_item

#rotate
execute store result score yaw terf_states run data get entity @s Rotation[0]
execute store result score pitch terf_states run data get entity @s Rotation[1]

scoreboard players add yaw terf_states 45
scoreboard players add pitch terf_states 45

scoreboard players operation yaw terf_states /= 90 terf_states
scoreboard players operation pitch terf_states /= 90 terf_states

execute as @e[tag=terf_currententity] store result entity @s Rotation[0] int 90 run scoreboard players get yaw terf_states
execute as @e[tag=terf_currententity] store result entity @s Rotation[1] int 90 run scoreboard players get pitch terf_states

execute if score pitch terf_states matches 1 run data modify entity @n[type=item_display,tag=terf_currententity] transformation.translation[2] set value -.5
execute if score pitch terf_states matches 0 run data modify entity @n[type=item_display,tag=terf_currententity] transformation.translation[1] set value .5
execute if score pitch terf_states matches -1 run data modify entity @n[type=item_display,tag=terf_currententity] transformation.translation[2] set value .5

#set marker power storage
execute as @n[type=marker,tag=terf_currententity] store result score @s datapipes_lib_power_max store result score @s datapipes_lib_power_storage run data get entity @n[type=item_display,tag=terf_currententity] item.components.minecraft:max_damage
execute store result score temp terf_states run data get entity @n[type=item_display,tag=terf_currententity] item.components.minecraft:damage
scoreboard players operation @n[type=marker,tag=terf_currententity] datapipes_lib_power_storage -= temp terf_states

tag @e remove terf_currententity