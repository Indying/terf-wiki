scoreboard players reset @s terf_data_A
playsound terf:alarms.toolbeep master @a[distance=0..] ~ ~ ~ 1 1.75
execute on passengers run data modify entity @s[type=item_display] item.components.minecraft:custom_model_data.colors set value [65280]
