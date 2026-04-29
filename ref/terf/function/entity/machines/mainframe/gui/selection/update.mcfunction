execute if score @s terf_data_C matches -1 run return run function terf:entity/machines/mainframe/gui/selection/go_back_screen

execute store result score output_machine_count terf_states run data get entity @s data.terf.mainframe.output_machines
scoreboard players remove output_machine_count terf_states 1
execute if score @s terf_data_C matches ..-2 run scoreboard players operation @s terf_data_C = output_machine_count terf_states

#get the id of the machine from the mainframes stored data
data modify storage terf:temp args set value {arg1:"data modify storage terf:temp args.arg2 set from entity @s data.terf.mainframe.output_machines[",arg3:"]"}
execute store result storage terf:temp args.arg2 float 1 run scoreboard players get @s terf_data_C
function datapipes_lib:require/with_args/3 with storage terf:temp args

#get the data of the machine to display, arg2 comes from the code above
scoreboard players set x terf_states -69420
scoreboard players set y terf_states -69420
scoreboard players set z terf_states -69420
scoreboard players set calc terf_states 0
scoreboard players set calc2 terf_states -69420

data modify storage terf:temp args merge value {arg1:"execute as @e[type=minecraft:marker,tag=terf_machineid_",arg3:"] run function terf:entity/machines/mainframe/gui/selection/get_machine_details"}
function datapipes_lib:require/with_args/3 with storage terf:temp args

#return to the go back screen at the end
execute if score calc2 terf_states matches -69420 run return run function terf:entity/machines/mainframe/gui/selection/go_back_screen

#display the machine details
data merge block ^ ^2 ^1 {front_text:{messages:[{"nbt":"args.machine_name","storage":"terf:temp","underlined":true,"color":"aqua"},[{"text":"Connections: "},{"score":{"objective":"terf_states","name":"calc"}}],[{"text":"id: "},{"score":{"objective":"terf_states","name":"calc2"}},{"text":"f"}],{"text":"click to modify","click_event":{"action":"run_command","command":"execute positioned ~ ~-2 ~ as @n[type=marker,tag=terf_mainframe,distance=..2] at @s run function terf:entity/machines/mainframe/gui/clicked_middle_screen"}}],color:white,has_glowing_text:1b},is_waxed:1b}
data merge block ^1 ^2 ^1 {front_text:{messages:[[{"text":"X: "},{"score":{"objective":"terf_states","name":"x"}}],[{"text":"Y: "},{"score":{"objective":"terf_states","name":"y"}}],[{"text":"Z: "},{"score":{"objective":"terf_states","name":"z"}}],{"text":">>>>>>>>>>>>>>>>>","click_event":{"action":"run_command","command":"execute positioned ~ ~-2 ~ as @n[type=marker,tag=terf_mainframe,distance=..2] at @s run function terf:entity/machines/mainframe/gui/clicked_right_screen"}}],color:white,has_glowing_text:1b},is_waxed:1b}

scoreboard players operation calc terf_states = @s terf_data_C
scoreboard players add calc terf_states 1
scoreboard players add output_machine_count terf_states 1
data merge block ^-1 ^2 ^1 {front_text:{messages:[[{"text":"Port: O."},{"score":{"objective":"terf_states","name":"calc"}},{"text":"/"},{"score":{"objective":"terf_states","name":"output_machine_count"}}],{"text":""},{"text":""},{"text":"<<<<<<<<<<<<<<<<<","click_event":{"action":"run_command","command":"execute positioned ~ ~-2 ~ as @n[type=marker,tag=terf_mainframe,distance=..2] at @s run function terf:entity/machines/mainframe/gui/clicked_left_screen"}}],color:white,has_glowing_text:1b},is_waxed:1b}
