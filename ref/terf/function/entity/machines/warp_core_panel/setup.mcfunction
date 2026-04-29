data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/warp_core_panel/slower_tick'
tag @s add terf_slower_ticked

data modify entity @s data.terf.machine_name set value "warp_controller"
data modify entity @s data.terf.mainframe_logistics.config set value {input_coords:"^ ^ ^1",is_input:1,load:5}
tag @s add terf_warp_core_panel
tag @s add terf_mainframe_interested
