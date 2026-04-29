data merge block ^1 ^1 ^1 {front_text:{messages:[{"text":"Increase power","click_event":{"action":"run_command","command":"data merge block ~ ~ ~ {front_text:{color:\"gray\"}}"},"color":"aqua"},{"text":"lasers","color":"aqua"},{"text":""},{"text":"+","color":"aqua"}]}}

scoreboard players operation calc terf_states = @s terf_data_B
data merge block ^ ^1 ^1 {front_text:{messages:[{"text":"Power Lasers","click_event":{"action":"run_command","command":"data merge block ~ ~ ~ {front_text:{color:\"gray\"}}"},"color":"aqua"},[{"score":{"name":"calc","objective":"terf_states"}},{"text":"%"}],[{"score":{"name":"core_temp_divided","objective":"terf_states"}},{"text":"°C"}],{"text":"Click to deselect","color":"aqua"}]}}

data merge block ^-1 ^1 ^1 {front_text:{messages:[{"text":"Decrease power","click_event":{"action":"run_command","command":"data merge block ~ ~ ~ {front_text:{color:\"gray\"}}"},"color":"aqua"},{"text":"lasers","color":"aqua"},{"text":""},{"text":"-","color":"aqua"}]}}
