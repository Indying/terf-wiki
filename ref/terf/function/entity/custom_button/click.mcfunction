execute on target if items entity @s weapon.offhand *[custom_data~{id:"terf:wrench"}] run return run function terf:entity/custom_button/replace_item

data modify storage terf:temp temp set from entity @s data.terf.links
execute if data storage terf:temp temp.minecraft:lever run function terf:entity/custom_button/activate_lever
execute if data storage terf:temp temp.minecraft:stone_button run function terf:entity/custom_button/activate_stone_button
execute if data storage terf:temp temp.minecraft:polished_blackstone_button run function terf:entity/custom_button/activate_blackstone_button
execute if data storage terf:temp temp.minecraft:dark_oak_button run function terf:entity/custom_button/activate_dark_oak_button





#apply link
data remove storage terf:temp temp
execute on target run data modify storage terf:temp temp set from entity @s SelectedItem.components.minecraft:custom_data.terf.links
execute unless data storage terf:temp temp run return fail
data modify entity @s data.terf.links set from storage terf:temp temp

scoreboard players set block_found terf_states 1
playsound terf:alarms.toolbeep player @a[distance=0..] ~ ~ ~ 1 0.8
playsound terf:alarms.beep4 player @a[distance=0..] ~ ~ ~ 1 0
execute on target run tellraw @s [{"text":"["},{"text":"Linker","color":"light_purple"},{"text":"] Applied first link to custom button"}]