data modify entity @s data.terf.multiblock_function set value 'if block ^1 ^ ^ loom if block ^ ^ ^-1 waxed_cut_copper run return run function terf:entity/machines/fission_reactor_panel/tick with entity @s data.terf'
tag @s add terf_slower_ticked

tag @s add terf_mainframe_interested
data modify entity @s data.terf.machine_name set value "fission_panel"
data modify entity @s data.terf.mainframe_logistics.config set value {input_coords:"^ ^ ^-1",is_output:1,load:7}
