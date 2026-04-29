#mainframe update buffering
execute if score @s terf_connected_mainframe_buffer = @s terf_connected_mainframe_buffer run scoreboard players operation @s terf_connected_mainframe = @s terf_connected_mainframe_buffer
execute unless score @s terf_connected_mainframe_buffer = @s terf_connected_mainframe_buffer run scoreboard players reset @s terf_connected_mainframe
scoreboard players reset @s terf_connected_mainframe_buffer

#slow displays
execute unless score @s terf_connected_mainframe = @s terf_connected_mainframe run return run data merge block ^ ^1 ^ {front_text:{messages:["",{"text":"No Signal","bold":true,"color":"red"},{"text":"||||||||||||||||||||||||","bold":true,"color":"red"},""],has_glowing_text:1b,color:"orange"},is_waxed:1b}
execute store result score calc terf_states run data get entity @s data.terf.security_config
scoreboard players operation calc2 terf_states = @s terf_data_B
execute unless score @s terf_data_A matches 1.. run data merge block ~ ~1 ~ {is_waxed:1b,front_text:{has_glowing_text:1b,color:"green",messages:[{"text":"Security Terminal","color":"#002200","click_event":{"action":"run_command","command":"data merge block ~ ~ ~ {front_text:{color:\"gray\"}}"}},[{"text":"whitelisted: ","color":"white"},{"score":{"name":"calc","objective":"terf_states"}}],[{"text":"updated: ","color":"white"},{"score":{"name":"calc2","objective":"terf_states"}}],{"text":"Click to Whitelist","color":"#002200"}]}}
