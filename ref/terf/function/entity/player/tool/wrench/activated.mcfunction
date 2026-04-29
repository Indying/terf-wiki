scoreboard players set terminated terf_states 20
scoreboard players set temp terf_states 0
function terf:entity/player/tool/wrench/raycast
execute if score temp terf_states matches 1 run item modify entity @s[gamemode=!creative] weapon {"function": "minecraft:set_damage","damage":-0.0021,"add":true}
execute if score temp terf_states matches 1 store result score temp2 terf_states run data get entity @s SelectedItem.components.minecraft:damage
execute if score temp terf_states matches 1 if score temp2 terf_states matches 1000.. run item modify entity @s weapon datapipes_lib:decrement_item
execute if score temp terf_states matches 1 if score temp2 terf_states matches 1000.. run playsound minecraft:entity.item.break master @a[distance=0..] ~ ~ ~ 1 1