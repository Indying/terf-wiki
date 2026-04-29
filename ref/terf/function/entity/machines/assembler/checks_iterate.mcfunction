data modify storage datapipes_lib:temp temp2 set from storage terf:temp array[0].items
execute if function datapipes_lib:item_transfer/compare_items/start run return run function terf:entity/machines/assembler/activated

data remove storage terf:temp array[0]
execute if data storage terf:temp array[0] run function terf:entity/machines/assembler/checks_iterate