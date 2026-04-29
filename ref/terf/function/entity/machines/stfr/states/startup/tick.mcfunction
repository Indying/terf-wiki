#override control panel text
data modify storage terf:temp displays.group_core[0].messages[0] set value {"text":". Awaiting .",screen_color:"yellow"}

scoreboard players add @s[tag=!terf_breakers_activated] terf_data_E 1
execute if score @s terf_data_E matches 2400.. run return run function terf:entity/machines/stfr/states/startup/abort_automatic
execute as @s[tag=!terf_key_on] run return run function terf:entity/machines/stfr/states/startup/abort_manual

tag @s add terf_breaker_interested

execute as @s[tag=!terf_breakers_activated,tag=terf_bcd_breakers] run function terf:entity/machines/stfr/states/startup/breakers_deactivated
execute as @s[tag=terf_breakers_activated,tag=!terf_bcd_breakers] run function terf:entity/machines/stfr/states/startup/breakers_activated

execute as @s[tag=terf_breakers_activated] run function terf:entity/machines/stfr/visuals/stabilizer/animation_tick

execute unless score NETratetimer terf_states >= NETrate terf_states run return fail
execute as @s[tag=terf_breakers_connected] run tag @s add terf_breakers_activated
execute as @s[tag=!terf_breakers_connected] run tag @s remove terf_breakers_activated
tag @s remove terf_breakers_connected