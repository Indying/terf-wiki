execute store result score terminated terf_states run attribute @s minecraft:block_interaction_range get 10

data remove storage terf:temp temp
execute if items entity @s weapon.offhand *[minecraft:consumable,minecraft:custom_data~{id:"terf:fire_extinguisher"}] run data modify storage terf:temp temp set from entity @s Inventory[{Slot:-106b}]
execute if items entity @s weapon.mainhand *[minecraft:consumable,minecraft:custom_data~{id:"terf:fire_extinguisher"}] run data modify storage terf:temp temp set from entity @s SelectedItem

scoreboard players set succeeded terf_states 0
function terf:entity/player/tool/fire_extinguisher/place_raycast

execute if score succeeded terf_states matches 0 run return fail
execute if items entity @s weapon.mainhand *[minecraft:consumable,minecraft:custom_data~{id:"terf:fire_extinguisher"}] run return run item replace entity @s weapon.mainhand with air
execute if items entity @s weapon.offhand *[minecraft:consumable,minecraft:custom_data~{id:"terf:fire_extinguisher"}] run item replace entity @s weapon.offhand with air
