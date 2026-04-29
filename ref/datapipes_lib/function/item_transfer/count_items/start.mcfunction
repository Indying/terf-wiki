#this function outputs the simplified contents of an inventory to datapipes_lib:temp temp
data modify storage datapipes_lib:temp temp set value []
data modify storage datapipes_lib:temp Items set from block ~ ~ ~ Items
scoreboard players set slot datapipes_lib 0
function datapipes_lib:item_transfer/count_items/as_slot {slot:0}
