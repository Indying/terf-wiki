scoreboard players set @s terf_data_A 0
data modify entity @s data.terf.stored_recipe.z set from storage terf:temp output.z
execute store result score @s terf_data_B run data get storage terf:temp output.t
item modify block ^ ^2 ^-2 container.2 datapipes_lib:decrement_item

scoreboard players set temp terf_states 1000000
scoreboard players operation temp terf_states /= @s terf_data_B
execute store result entity @s data.terf.stored_recipe.pvel float 0.0000035 run scoreboard players get temp terf_states