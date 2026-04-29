#explode capsule if it is incapable of holding antimatter
execute unless items entity @s container.0 *[minecraft:custom_data~{id:"terf:electromagnetic_capsule"}] run function terf:entity/player/tool/capsule/attempt_explosion with entity @s item.components.minecraft:custom_data.terf.capsule_contents[0]
execute unless items entity @s container.0 *[minecraft:custom_data~{id:"terf:electromagnetic_capsule"}] run function terf:entity/player/tool/capsule/attempt_explosion with entity @s item.components.minecraft:custom_data.fluids[0]

#modify lore of the capsule
data modify storage terf:temp temp set from entity @s item.components.minecraft:custom_data.terf.capsule_contents
data modify storage terf:temp temp set from entity @s item.components.minecraft:custom_data.fluids
function terf:require/make_fluid_lore
data modify entity @s item.components.minecraft:lore set from storage terf:temp output

function terf:require/drop_item_display