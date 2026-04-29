#set the minecraft:item_name of the item display temp entity from its minecraft:custom_data.fluids[0], if it dosent exist just set it to "Syringe"
execute unless data entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.fluids[0] run data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:item_name set value "Syringe"

data modify storage terf:temp args set from entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.fluids[0]
function terf:require/get_fluid_dictionary with storage terf:temp args
data modify storage terf:temp args.name set from storage terf:temp output.name
function terf:entity/player/tool/syringe/set_name_args with storage terf:temp args
