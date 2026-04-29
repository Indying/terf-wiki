function datapipes_lib:item_transfer/compare_items/args with storage datapipes_lib:temp array[0]
execute if score storage_count datapipes_lib < count datapipes_lib run return run data modify storage datapipes_lib:temp array append value "invalid"

data remove storage datapipes_lib:temp array[0]
execute if data storage datapipes_lib:temp array[0] run function datapipes_lib:item_transfer/compare_items/iterate