scoreboard players set @s terf_coas_click 0
execute if score @s terf_data_G matches 1.. run return fail

execute if items entity @s weapon.mainhand carrot_on_a_stick run function terf:entity/player/tool/carrot_on_a_stick_click_mainhand with entity @s SelectedItem.components.minecraft:custom_data.terf
execute unless items entity @s weapon.offhand carrot_on_a_stick run return fail
function terf:entity/player/tool/carrot_on_a_stick_click_offhand with entity @s equipment.offhand.components.minecraft:custom_data.terf
execute unless data entity @s equipment.offhand.components.minecraft:custom_data.terf.click_offhand run function terf:entity/player/tool/carrot_on_a_stick_click_mainhand with entity @s equipment.offhand.components.minecraft:custom_data.terf
