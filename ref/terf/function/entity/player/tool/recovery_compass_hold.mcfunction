#this is pretty much the same as with the carrot on a stick
execute if items entity @s weapon.mainhand recovery_compass run function terf:entity/player/tool/carrot_on_a_stick_hold_mainhand with entity @s SelectedItem.components.minecraft:custom_data.terf
execute unless items entity @s weapon.offhand recovery_compass run return fail
function terf:entity/player/tool/carrot_on_a_stick_hold_offhand with entity @s equipment.offhand.components.minecraft:custom_data.terf
execute unless data entity @s equipment.offhand.components.minecraft:custom_data.terf.held_offhand run function terf:entity/player/tool/carrot_on_a_stick_hold_mainhand with entity @s equipment.offhand.components.minecraft:custom_data.terf
