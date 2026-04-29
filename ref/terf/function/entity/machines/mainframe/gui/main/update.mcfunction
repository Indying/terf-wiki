data merge block ^-1 ^2 ^1 {front_text:{has_glowing_text:1b,color:"white"},is_waxed:0b}
data modify block ^-1 ^2 ^1 front_text.messages[0] set value {"text":"Database Search"}
data modify block ^-1 ^2 ^1 front_text.messages[1] set value {"text":"enter name below","color":"gray"}

scoreboard players set calc terf_states 0
data modify storage terf:temp args.name set string block ^-1 ^2 ^1 front_text.messages[2]
function terf:entity/machines/mainframe/gui/main/secure_parse with storage terf:temp args

execute unless score calc terf_states matches 0 as @s[tag=!terf_mainframegui_machinesgui_selected] run data modify block ^-1 ^2 ^1 front_text.messages[3] set value [{"text":"id:"},{"score":{"objective":"terf_states","name":"calc"}}]
execute if score calc terf_states matches 0 run data modify block ^-1 ^2 ^1 front_text.messages[3] set value [{"text":"Nothing Found"}]

scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players operation temp2 terf_states = @s terf_data_F
data merge block ^ ^2 ^1 {front_text:{messages:[{"text":"Mainframe"},[{"text":"servers: "},{"score":{"objective":"terf_states","name":"temp"}},{"text":"f"}],[{"text":"load: "},{"score":{"objective":"terf_states","name":"temp2"}},{"text":"f"}],[{"text":"brush: "},{"score":{"objective":"terf_states","name":"corepressuredivided"}},{"text":"f"}]],has_glowing_text:1b,color:"white"},is_waxed:1b}

scoreboard players operation temp terf_states = @s terf_data_B
data merge block ^1 ^2 ^1 {front_text:{messages:[{"text":"machines:"},[{"text":"Connected: "},{"score":{"objective":"terf_states","name":"temp"}},{"text":"f"}],[{"text":"edk: "},{"score":{"objective":"terf_states","name":"coretempdivided"}},{"text":"f"}],{"text":"click to configure","click_event":{"action":"run_command","command":"execute positioned ~ ~-2 ~ as @n[type=marker,tag=terf_mainframe,distance=..2] at @s run function terf:entity/machines/mainframe/gui/clicked_right_screen"}}],has_glowing_text:1b,color:"white"},is_waxed:1b}
