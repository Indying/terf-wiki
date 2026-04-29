data merge block ^ ^1 ^1 {front_text:{messages:[{"text":"Reactor Stats","click_event":{"action":"run_command","command":"data merge block ~ ~ ~ {front_text:{color:\"gray\"}}"},"color":"aqua"},{"text":""},[{"score":{"name":"core_temp_divided","objective":"terf_states"}},{"text":"°C"}],{"text":"Click to deselect","color":"aqua"}]}}
execute as @s[tag=!terf_displaytopcoil] run function terf:entity/machines/opencore_control_panel/display_stats_bottomcoil
execute as @s[tag=terf_displaytopcoil] run function terf:entity/machines/opencore_control_panel/display_stats_topcoil
