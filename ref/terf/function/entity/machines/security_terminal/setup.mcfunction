data modify entity @s data.terf.machine_name set value SecurityTerminal
data modify entity @s data.terf.mainframe_logistics.config set value {input_coords:"~ ~-1 ~",is_output:1,load:1}
data modify entity @s data.terf.multiblock_function set value 'if block ^ ^ ^-1 loom if block ^ ^1 ^-1 observer[facing=down] run return run function terf:entity/machines/security_terminal/tick'

$summon minecraft:item_display ~ ~.5 ~ {Rotation:[$(rotation)f,0f],Tags:["terf_security_terminal_top","terf_related_$(machine_id)"],item:{id:"minecraft:carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/security_terminal"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.001f,1.001f,1.001f]}}

$summon minecraft:interaction ^-.375 ^.5638 ^-.188 {Tags:["terf_1","terf_related_$(machine_id)"],response:1b,width:0.125,height:0.03,data:{terf:{machine_id:$(machine_id)},on_player_click:"function terf:entity/machines/security_terminal/keypad_pressed"}}
$summon minecraft:interaction ^-.219 ^.5638 ^-.188 {Tags:["terf_2","terf_related_$(machine_id)"],response:1b,width:0.125,height:0.03,data:{terf:{machine_id:$(machine_id)},on_player_click:"function terf:entity/machines/security_terminal/keypad_pressed"}}
$summon minecraft:interaction ^-.0625 ^.5638 ^-.188 {Tags:["terf_3","terf_related_$(machine_id)"],response:1b,width:0.125,height:0.03,data:{terf:{machine_id:$(machine_id)},on_player_click:"function terf:entity/machines/security_terminal/keypad_pressed"}}

$summon minecraft:interaction ^-.375 ^.5638 ^-.03 {Tags:["terf_4","terf_related_$(machine_id)"],response:1b,width:0.125,height:0.03,data:{terf:{machine_id:$(machine_id)},on_player_click:"function terf:entity/machines/security_terminal/keypad_pressed"}}
$summon minecraft:interaction ^-.219 ^.5638 ^-.03 {Tags:["terf_5","terf_related_$(machine_id)"],response:1b,width:0.125,height:0.03,data:{terf:{machine_id:$(machine_id)},on_player_click:"function terf:entity/machines/security_terminal/keypad_pressed"}}
$summon minecraft:interaction ^-.0625 ^.5638 ^-.03 {Tags:["terf_6","terf_related_$(machine_id)"],response:1b,width:0.125,height:0.03,data:{terf:{machine_id:$(machine_id)},on_player_click:"function terf:entity/machines/security_terminal/keypad_pressed"}}

$summon minecraft:interaction ^-.375 ^.5638 ^.125 {Tags:["terf_7","terf_related_$(machine_id)"],response:1b,width:0.125,height:0.03,data:{terf:{machine_id:$(machine_id)},on_player_click:"function terf:entity/machines/security_terminal/keypad_pressed"}}
$summon minecraft:interaction ^-.219 ^.5638 ^.125 {Tags:["terf_8","terf_related_$(machine_id)"],response:1b,width:0.125,height:0.03,data:{terf:{machine_id:$(machine_id)},on_player_click:"function terf:entity/machines/security_terminal/keypad_pressed"}}
$summon minecraft:interaction ^-.0625 ^.5638 ^.125 {Tags:["terf_9","terf_related_$(machine_id)"],response:1b,width:0.125,height:0.03,data:{terf:{machine_id:$(machine_id)},on_player_click:"function terf:entity/machines/security_terminal/keypad_pressed"}}

$summon minecraft:interaction ^-.375 ^.5638 ^.312 {Tags:["terf_red","terf_related_$(machine_id)"],response:1b,width:0.125,height:0.03,data:{terf:{machine_id:$(machine_id)},on_player_click:"function terf:entity/machines/security_terminal/keypad_pressed"}}
$summon minecraft:interaction ^-.219 ^.5638 ^.312 {Tags:["terf_0","terf_related_$(machine_id)"],response:1b,width:0.125,height:0.03,data:{terf:{machine_id:$(machine_id)},on_player_click:"function terf:entity/machines/security_terminal/keypad_pressed"}}
$summon minecraft:interaction ^-.0625 ^.5638 ^.312 {Tags:["terf_green","terf_related_$(machine_id)"],response:1b,width:0.125,height:0.03,data:{terf:{machine_id:$(machine_id)},on_player_click:"function terf:entity/machines/security_terminal/enter_pressed with entity @s data.terf"}}

$summon minecraft:interaction ^.31 ^0.57 ^-.15 {Tags:["terf_reader","terf_related_$(machine_id)"],response:1b,width:0.3,height:0.06,data:{terf:{machine_id:$(machine_id)},on_player_click:"function terf:entity/machines/security_terminal/toggle_all_machines with entity @s data.terf"}}

data modify entity @s data.terf.security_config set value []
tag @s add terf_mainframe_interested
tag @s add terf_security_terminal
