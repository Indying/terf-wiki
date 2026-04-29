data modify block ^-1 ^1 ^1 front_text.messages[0] set value {"text":"Displaying: Top","color":"aqua"}

data modify block ^-1 ^1 ^1 front_text.messages[3] set value {"text":"Click To Switch","color":"dark_aqua","click_event":{"action":"run_command","command":"data merge block ~ ~ ~ {front_text:{color:\"gray\"}}"}}

execute as @s[tag=terf_topcoil] run data modify block ^-1 ^1 ^1 front_text.messages[1] set value {"text":"Top Coil: ✔","color":"green"}
execute as @s[tag=terf_stab_unw] run data modify block ^1 ^1 ^1 front_text.messages[0] set value {"text":"Stab. U-NW: ✔","color":"green"}
execute as @s[tag=terf_stab_une] run data modify block ^1 ^1 ^1 front_text.messages[1] set value {"text":"Stab. U-NE: ✔","color":"green"}
execute as @s[tag=terf_stab_use] run data modify block ^1 ^1 ^1 front_text.messages[2] set value {"text":"Stab. U-SE: ✔","color":"green"}
execute as @s[tag=terf_stab_usw] run data modify block ^1 ^1 ^1 front_text.messages[3] set value {"text":"Stab. U-SW: ✔","color":"green"}

execute as @s[tag=!terf_topcoil] run data modify block ^-1 ^1 ^1 front_text.messages[1] set value {"text":"Top Coil: ⚠","color":"red"}
execute as @s[tag=!terf_stab_unw] run data modify block ^1 ^1 ^1 front_text.messages[0] set value {"text":"Stab. U-NW: ⚠","color":"red"}
execute as @s[tag=!terf_stab_une] run data modify block ^1 ^1 ^1 front_text.messages[1] set value {"text":"Stab. U-NE: ⚠","color":"red"}
execute as @s[tag=!terf_stab_use] run data modify block ^1 ^1 ^1 front_text.messages[2] set value {"text":"Stab. U-SE: ⚠","color":"red"}
execute as @s[tag=!terf_stab_usw] run data modify block ^1 ^1 ^1 front_text.messages[3] set value {"text":"Stab. U-SW: ⚠","color":"red"}
