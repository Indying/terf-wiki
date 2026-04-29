#fail if detonation is charging
execute if score @s terf_data_A matches ..50 run return fail

playsound minecraft:block.heavy_core.break master @a[distance=0..] ~ ~ ~

function terf:entity/player/tool/electron_bomb/update_display

#set damage to stored power
execute on passengers run scoreboard players operation temp terf_states = @s[type=marker] datapipes_lib_power_max
execute on passengers run scoreboard players operation temp terf_states -= @s[type=marker] datapipes_lib_power_storage
execute on passengers store result entity @s[type=item_display] item.components.minecraft:damage int 1 run scoreboard players get temp terf_states

execute on passengers run function terf:require/drop_item_display
kill @s
