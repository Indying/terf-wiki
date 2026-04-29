data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/opencore/tick with entity @s data.terf'

tag @s add datapipes_lib_power_consumer
tag @s add terf_mainframe_interested
tag @s add terf_opencore
data modify entity @s Rotation set value [0f,0f]
data modify entity @s data.power set value {checks:"if block ^-1 ^ ^-1 red_glazed_terracotta"}
data modify entity @s data.terf.machine_name set value OpenCore
execute unless data entity @s data.terf.mainframe_logistics.config run data modify entity @s data.terf.mainframe_logistics.config set value {is_output:1,load:1,can_link_to:{opencore_controller:1}}
scoreboard players add @s terf_data_A 0
