data modify block ^-1 ^1 ^1 front_text.messages[0] set value {"text":"Displaying: Bottom","color":"aqua"}

data modify block ^-1 ^1 ^1 front_text.messages[3] set value {"text":"Click To Switch","color":"dark_aqua","click_event":{"action":"run_command","command":"data merge block ~ ~ ~ {front_text:{color:\"gray\"}}"}}

execute as @s[tag=terf_bottomcoil] run data modify block ^-1 ^1 ^1 front_text.messages[1] set value {"text":"Bottom Coil: ✔","color":"green"}
execute as @s[tag=terf_stab_dnw] run data modify block ^1 ^1 ^1 front_text.messages[0] set value {"text":"Stab. D-NW: ✔","color":"green"}
execute as @s[tag=terf_stab_dne] run data modify block ^1 ^1 ^1 front_text.messages[1] set value {"text":"Stab. D-NE: ✔","color":"green"}
execute as @s[tag=terf_stab_dse] run data modify block ^1 ^1 ^1 front_text.messages[2] set value {"text":"Stab. D-SE: ✔","color":"green"}
execute as @s[tag=terf_stab_dsw] run data modify block ^1 ^1 ^1 front_text.messages[3] set value {"text":"Stab. D-SW: ✔","color":"green"}

execute as @s[tag=!terf_bottomcoil] run data modify block ^-1 ^1 ^1 front_text.messages[1] set value {"text":"Bottom Coil: ⚠","color":"red"}
execute as @s[tag=!terf_stab_dnw] run data modify block ^1 ^1 ^1 front_text.messages[0] set value {"text":"Stab. D-NW: ⚠","color":"red"}
execute as @s[tag=!terf_stab_dne] run data modify block ^1 ^1 ^1 front_text.messages[1] set value {"text":"Stab. D-NE: ⚠","color":"red"}
execute as @s[tag=!terf_stab_dse] run data modify block ^1 ^1 ^1 front_text.messages[2] set value {"text":"Stab. D-SE: ⚠","color":"red"}
execute as @s[tag=!terf_stab_dsw] run data modify block ^1 ^1 ^1 front_text.messages[3] set value {"text":"Stab. D-SW: ⚠","color":"red"}
