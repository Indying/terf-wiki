#this function inputs the simplified contents of an inventory from datapipes_lib:temp temp, and removes them from the container, items that could not be removed get returned to datapipes_lib:temp temp
data modify storage datapipes_lib:temp Items set from block ~ ~ ~ Items
scoreboard players set slot datapipes_lib 0
function datapipes_lib:item_transfer/remove_items/as_slot {slot:0}
data modify block ~ ~ ~ Items set from storage datapipes_lib:temp Items
