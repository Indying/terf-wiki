data modify entity @s data.terf.multiblock_function set value 'if block ^ ^1 ^ loom if block ^ ^ ^1 quartz_block if block ^-1 ^ ^ waxed_cut_copper if block ^-1 ^1 ^ granite_wall run return run function terf:entity/machines/fission_sensor/slower_tick'
tag @s add terf_slower_ticked
tag @s add terf_fission_sensor

data modify entity @s data.terf.machine_name set value "NT-Sensor"
data modify entity @s data.terf.mainframe_logistics.config set value {input_coords:"^-1 ^ ^",is_input:1,load:2}
tag @s add terf_mainframe_interested
