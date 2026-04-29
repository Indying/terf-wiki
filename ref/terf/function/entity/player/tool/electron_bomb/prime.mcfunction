execute on passengers run scoreboard players operation power_storage terf_states = @s[type=marker] datapipes_lib_power_storage
execute on passengers run scoreboard players operation power_max terf_states = @s[type=marker] datapipes_lib_power_max
execute if score power_storage terf_states < power_max terf_states run return fail

execute on passengers if entity @s[type=item_display] store result score temp terf_states run data get entity @s item.components.minecraft:custom_data.terf.timer
scoreboard players operation @s terf_data_A = temp terf_states
playsound terf:alarms.toolbeep master @a[distance=0..] ~ ~ ~ 1 2

execute on passengers run data modify entity @s[type=item_display] item.components.minecraft:custom_model_data.colors set value [16711680]
