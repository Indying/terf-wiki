execute if score @s terf_data_E matches -1 run return run function terf:entity/machines/mainframe/gui/linking/go_back_screen

execute store result score input_machine_count terf_states run data get entity @s data.terf.mainframe.input_machines
scoreboard players remove input_machine_count terf_states 1
execute if score @s terf_data_E matches ..-2 run scoreboard players operation @s terf_data_E = input_machine_count terf_states

#get the id of the output machine from the mainframes stored data
data modify storage terf:temp args set value {arg1:"data modify storage terf:temp args.arg2 set from entity @s data.terf.mainframe.output_machines[",arg3:"]"}
execute store result storage terf:temp args.arg2 float 1 run scoreboard players get @s terf_data_C
function datapipes_lib:require/with_args/3 with storage terf:temp args

execute store result score temp2 terf_states run data get storage terf:temp args.arg2

#get the name of the output machine
data modify storage terf:temp args merge value {arg1:"data modify storage terf:temp args.output_machine_name set from entity @e[type=minecraft:marker,tag=terf_machineid_",arg3:",limit=1] data.terf.machine_name"}
function datapipes_lib:require/with_args/3 with storage terf:temp args

#get the id of the input machine from the mainframes stored data
data modify storage terf:temp args merge value {arg1:"data modify storage terf:temp args.arg2 set from entity @s data.terf.mainframe.input_machines[",arg3:"]"}
execute store result storage terf:temp args.arg2 float 1 run scoreboard players get @s terf_data_E
function datapipes_lib:require/with_args/3 with storage terf:temp args

#get the data of the machine to display, arg2 comes from the code above
scoreboard players set x terf_states -69420
scoreboard players set y terf_states -69420
scoreboard players set z terf_states -69420
scoreboard players set calc terf_states 0
scoreboard players set temp terf_states -69420

data modify storage terf:temp args merge value {arg1:"execute as @e[type=minecraft:marker,tag=terf_machineid_",arg3:"] run function terf:entity/machines/mainframe/gui/linking/get_machine_details"}
function datapipes_lib:require/with_args/3 with storage terf:temp args

#return to the go back screen at the end
execute if score temp terf_states matches -69420 run return run function terf:entity/machines/mainframe/gui/linking/go_back_screen

#display the machine details
data merge block ^ ^2 ^1 {front_text:{messages:[{"nbt":"args.output_machine_name","storage":"terf:temp","color":"aqua"},{"text":"Click to Link to:","color":"green"},{"nbt":"args.machine_name","storage":"terf:temp","underlined":true,"click_event":{"action":"run_command","command":"execute positioned ~ ~-2 ~ as @n[type=marker,tag=terf_mainframe,distance=..2] at @s run function terf:entity/machines/mainframe/gui/clicked_middle_screen"}},[{"text":"id: "},{"score":{"objective":"terf_states","name":"temp"}},{"text":"f"}]],color:white,has_glowing_text:1b},is_waxed:1b}
execute if function terf:entity/machines/mainframe/are_machines_linked run data merge block ^ ^2 ^1 {front_text:{messages:[{"nbt":"args.output_machine_name","storage":"terf:temp","color":"aqua"},{"text":"Click to Unlink:","color":"red"},{"nbt":"args.machine_name","storage":"terf:temp","underlined":true,"click_event":{"action":"run_command","command":"execute positioned ~ ~-2 ~ as @n[type=marker,tag=terf_mainframe,distance=..2] at @s run function terf:entity/machines/mainframe/gui/clicked_middle_screen"}},[{"text":"id: "},{"score":{"objective":"terf_states","name":"temp"}},{"text":"f"}]],color:white,has_glowing_text:1b},is_waxed:1b}

data merge block ^1 ^2 ^1 {front_text:{messages:[[{"text":"X: "},{"score":{"objective":"terf_states","name":"x"}}],[{"text":"Y: "},{"score":{"objective":"terf_states","name":"y"}}],[{"text":"Z: "},{"score":{"objective":"terf_states","name":"z"}}],{"text":">>>>>>>>>>>>>>>>>","click_event":{"action":"run_command","command":"execute positioned ~ ~-2 ~ as @n[type=marker,tag=terf_mainframe,distance=..2] at @s run function terf:entity/machines/mainframe/gui/clicked_right_screen"}}],color:white,has_glowing_text:1b},is_waxed:1b}

scoreboard players operation calc terf_states = @s terf_data_E
scoreboard players add calc terf_states 1
scoreboard players add input_machine_count terf_states 1
data merge block ^-1 ^2 ^1 {front_text:{messages:[[{"text":"Port: I."},{"score":{"objective":"terf_states","name":"calc"}},{"text":"/"},{"score":{"objective":"terf_states","name":"input_machine_count"}}],[{"text":"Provider: "},{"score":{"objective":"terf_states","name":"temp2"}}],{"text":""},{"text":"<<<<<<<<<<<<<<<<<","click_event":{"action":"run_command","command":"execute positioned ~ ~-2 ~ as @n[type=marker,tag=terf_mainframe,distance=..2] at @s run function terf:entity/machines/mainframe/gui/clicked_left_screen"}}],color:white,has_glowing_text:1b},is_waxed:1b}
