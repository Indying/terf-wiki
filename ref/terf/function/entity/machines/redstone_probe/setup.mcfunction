data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/redstone_probe/slower_tick'
tag @s add terf_slower_ticked
tag @s add terf_redstone_probe

tag @s add terf_mainframe_interested
data modify entity @s data.terf.mainframe_logistics.config set value {load:1,input_coords:'~ ~ ~',is_input:1}
data modify entity @s data.terf.machine_name set value "redstone_probe"
