data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/opencore_control_panel/slower_tick'
tag @s add terf_slower_ticked

data modify entity @s data.terf.machine_name set value "opencore_panel"
data modify entity @s data.terf.mainframe_logistics.config set value {input_coords:"^ ^-1 ^",is_input:1,load:1}
tag @s add terf_opencore_controller
tag @s add terf_mainframe_interested
