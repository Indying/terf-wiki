function terf:entity/vehicle/hoverbike/summon
data modify storage terf:temp temp set from entity @s SelectedItem
data remove storage terf:temp temp.components.minecraft:lore
data modify entity @n[type=item_display,tag=terf_hoverbike] item set from storage terf:temp temp
execute store result score @n[type=interaction,tag=terf_hoverbike] terf_data_B run data get entity @s SelectedItem.components.minecraft:custom_model_data.colors[1]
execute store result score @n[type=interaction,tag=terf_hoverbike] datapipes_lib_power_storage run data get entity @s SelectedItem.components.minecraft:custom_model_data.colors[2]
scoreboard players set @n[type=interaction,tag=terf_currententity] datapipes_lib_power_max 5000000

item modify entity @s weapon.mainhand datapipes_lib:decrement_item
