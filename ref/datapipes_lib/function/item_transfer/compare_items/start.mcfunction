#this function returns true if the count of all items of datapipes_lib:temp temp2 have a count that is less or equal in datapipes_lib:temp temp
data modify storage datapipes_lib:temp array set from storage datapipes_lib:temp temp2
function datapipes_lib:item_transfer/compare_items/iterate
execute unless data storage datapipes_lib:temp array[0] run return 1