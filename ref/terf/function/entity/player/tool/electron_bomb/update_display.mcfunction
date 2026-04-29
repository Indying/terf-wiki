execute on passengers run scoreboard players operation power_storage terf_states = @s[type=marker] datapipes_lib_power_storage
execute on passengers run scoreboard players operation power_max terf_states = @s[type=marker] datapipes_lib_power_max

execute if score power_storage terf_states = power_max terf_states on passengers run return run data modify entity @s[type=item_display] item.components.minecraft:custom_model_data.colors set value [65280]
execute if score power_storage terf_states matches 1.. on passengers run data modify entity @s[type=item_display] item.components.minecraft:custom_model_data.colors set value [16776960]
