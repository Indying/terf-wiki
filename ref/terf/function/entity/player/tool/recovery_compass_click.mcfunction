advancement revoke @s only terf:internal/cd_recovery_compass

execute if items entity @s weapon.mainhand recovery_compass anchored eyes run function terf:entity/player/tool/recovery_compass_click_mainhand with entity @s SelectedItem.components.minecraft:custom_data.terf
execute unless items entity @s weapon.offhand recovery_compass run return fail
execute anchored eyes run function terf:entity/player/tool/recovery_compass_click_offhand with entity @s equipment.offhand.components.minecraft:custom_data.terf
execute unless data entity @s equipment.offhand.components.minecraft:custom_data.terf.click_offhand anchored eyes run function terf:entity/player/tool/recovery_compass_click_mainhand with entity @s equipment.offhand.components.minecraft:custom_data.terf
