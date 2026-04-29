data modify entity @s data.terf.multiblock_function set value 'if block ^-1 ^ ^ waxed_cut_copper run return run function terf:entity/machines/stfr_control_panel/slower_tick'
tag @s add terf_slower_ticked

data modify entity @s data.terf.machine_name set value "stfr_controller"
data modify entity @s data.terf.mainframe_logistics.config set value {input_coords:"^-1 ^ ^",is_input:1,load:5}

tag @s add terf_stfr_controller
tag @s add terf_mainframe_interested
