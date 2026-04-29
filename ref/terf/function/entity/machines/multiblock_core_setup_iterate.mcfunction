$execute $(checks) run return run $(function)
data remove storage terf:temp temp[0]
execute if data storage terf:temp temp[0] run function terf:entity/machines/multiblock_core_setup_iterate with storage terf:temp temp[0]