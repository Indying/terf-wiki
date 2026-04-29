#mainframe update buffering
execute if score @s terf_connected_mainframe_buffer = @s terf_connected_mainframe_buffer run scoreboard players operation @s terf_connected_mainframe = @s terf_connected_mainframe_buffer
execute unless score @s terf_connected_mainframe_buffer = @s terf_connected_mainframe_buffer run scoreboard players reset @s terf_connected_mainframe
scoreboard players reset @s terf_connected_mainframe_buffer

#get data from reactor sensor
scoreboard players set average_neutron_speed terf_states 0
scoreboard players set neutron_flux terf_states 0
scoreboard players set fuel_rod_count terf_states 0
scoreboard players set average_temp terf_states 0
scoreboard players set max_temp terf_states -69420

scoreboard players operation calc terf_states = @s terf_connected_mainframe
$execute at @e[type=marker,tag=terf_linked_to_$(machine_id),tag=terf_fission_sensor] if score @e[type=marker,distance=..0.01,limit=1] terf_connected_mainframe = calc terf_states if block ~ ~ ~ minecraft:granite_stairs if block ^ ^1 ^ loom if block ^ ^ ^1 minecraft:quartz_block if block ^-1 ^ ^ minecraft:waxed_cut_copper if block ^-1 ^1 ^ minecraft:granite_wall run function terf:entity/machines/fission_sensor/get_data

scoreboard players operation average_temp terf_states /= fuel_rod_count terf_states
scoreboard players operation average_neutron_speed terf_states /= neutron_flux terf_states

execute unless score max_temp terf_states matches 600.. run data merge block ^1 ^3 ^1 {is_waxed:1b,front_text:{color:green,has_glowing_text:1,messages:[[{"text":"Fuel Rod Stats","color":"#99FF99"}],[{"text":"Max Temp: ","color":"#000000"},{"score":{"objective":"terf_states","name":"max_temp"}},{"text":"°C"}],[{"text":"Avg. Temp: ","color":"#000000"},{"score":{"objective":"terf_states","name":"average_temp"}},{"text":"°C"}],[{"text":"Rod Count: ","color":"#000000"},{"score":{"objective":"terf_states","name":"fuel_rod_count"}}]]}}
execute if score max_temp terf_states matches 600.. run data merge block ^1 ^3 ^1 {is_waxed:1b,front_text:{color:green,has_glowing_text:1,messages:[[{"text":"Fuel Rod Stats","color":"#99FF99"}],[{"text":"Max Temp: ","color":"#FF0000"},{"score":{"objective":"terf_states","name":"max_temp"}},{"text":"°C"}],[{"text":"Avg. Temp: ","color":"#000000"},{"score":{"objective":"terf_states","name":"average_temp"}},{"text":"°C"}],[{"text":"Rod Count: ","color":"#000000"},{"score":{"objective":"terf_states","name":"fuel_rod_count"}}]]}}

data merge block ^ ^3 ^1 {is_waxed:1b,front_text:{color:green,has_glowing_text:1,messages:[[{"text":"Reaction Status","color":"#99FF99"}],[{"text":"Neut. Flux: ","color":"#000000"},{"score":{"objective":"terf_states","name":"neutron_flux"}}],[{"text":"Avg. Speed: ","color":"#000000"},{"score":{"objective":"terf_states","name":"average_neutron_speed"}}],""]}}

execute if score max_temp terf_states matches -69420 run data modify block ^1 ^3 ^1 front_text.messages set value [[{"text":"Fuel Rod Stats","color":"#99FF99"}],[{"text":"\u26a0 No Sensor \u26a0","color":"#FF0000"}],[{"text":"\u26a0 No Sensor \u26a0","color":"#FF0000"}],[{"text":"\u26a0 No Sensor \u26a0","color":"#FF0000"}]]
execute if score max_temp terf_states matches -69420 run data modify block ^ ^3 ^1 front_text.messages set value [[{"text":"Reaction Status","color":"#99FF99"}],[{"text":"\u26a0 No Sensor \u26a0","color":"#FF0000"}],[{"text":"\u26a0 No Sensor \u26a0","color":"#FF0000"}],""]

execute if score max_temp terf_states matches -420 run data modify block ^1 ^3 ^1 front_text.messages set value [[{"text":"Fuel Rod Stats","color":"#99FF99"}],[{"text":"! No Rod Data !","color":"#FFFF00"}],[{"text":"! No Rod Data !","color":"#FFFF00"}],[{"text":"! No Rod Data !","color":"#FFFF00"}]]

execute if score max_temp terf_states matches 600.. run playsound terf:alarms.alarm7 master @a[distance=0..] ~ ~ ~ 2 1.8

#redstone probe integration
execute unless score NETratetimer terf_states >= NETrate terf_states run return fail
$execute as @e[type=marker,tag=terf_linked_to_$(machine_id),tag=terf_redstone_probe] at @s run function terf:entity/machines/redstone_probe/machine_tick
