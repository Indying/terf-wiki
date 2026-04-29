#prepare continuing onto next slot
scoreboard players add slot datapipes_lib 1
execute if score slot datapipes_lib matches 27.. run return fail
execute store result storage datapipes_lib:temp args.slot int 1 run scoreboard players get slot datapipes_lib

#check for items in the current slot
data remove storage datapipes_lib:temp slot
$data modify storage datapipes_lib:temp slot set from storage datapipes_lib:temp Items[{Slot:$(slot)b}]

#if there is no item, continue onto next slot
execute unless data storage datapipes_lib:temp slot run return run function datapipes_lib:item_transfer/count_items/as_slot with storage datapipes_lib:temp args

#handle custom data
data modify storage datapipes_lib:temp slot.id set from storage datapipes_lib:temp slot.components.minecraft:custom_data.id

function datapipes_lib:item_transfer/count_items/args with storage datapipes_lib:temp slot

#continue onto next slot
function datapipes_lib:item_transfer/count_items/as_slot with storage datapipes_lib:temp args