#read values from connected panels
scoreboard players operation calc terf_states = @s terf_connected_mainframe
$execute at @e[type=marker,tag=terf_linked_to_$(machine_id),tag=terf_warp_core_panel] if score @e[type=marker,distance=..0.01,limit=1] terf_connected_mainframe = calc terf_states if block ^-1 ^ ^ loom if block ^ ^ ^1 waxed_cut_copper run function terf:entity/machines/warp_core_panel/parse_screens/start with storage terf:temp args
