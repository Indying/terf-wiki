tag @s remove terf_hadronprimed
execute if block ^1 ^-1 ^ #terf:redstoneactive[powered=true] run tag @s add terf_hadronprimed
execute if block ^ ^-1 ^ #terf:redstoneactive[powered=true] if score @s terf_data_D matches 2.. unless score @s terf_data_A matches 1.. run scoreboard players remove @s terf_data_D 1
execute if block ^-1 ^-1 ^ #terf:redstoneactive[powered=true] if score @s terf_data_D matches ..15 unless score @s terf_data_A matches 1.. run scoreboard players add @s terf_data_D 1

execute positioned ^ ^-1 ^ run function terf:require/turn_off_stone_button
execute positioned ^-1 ^-1 ^ run function terf:require/turn_off_stone_button

scoreboard players set temp terf_states 0
execute as @s[tag=terf_hadronprimed] run scoreboard players set temp terf_states 3
execute if score @s terf_data_A matches 1.. run scoreboard players set temp terf_states 1
execute unless score @s[tag=terf_hadronprimed] datapipes_lib_power_storage matches 10000.. run scoreboard players set temp terf_states 2
execute as @s[tag=terf_hadronprimed,tag=!terf_collider_case] run scoreboard players set temp terf_states 6
execute as @s[tag=terf_hadronfailed] run scoreboard players set temp terf_states 5

scoreboard players operation temp2 terf_states = @s terf_data_B
execute if score temp terf_states matches 5 run scoreboard players remove temp2 terf_states 1250
scoreboard players operation temp2 terf_states /= 20 terf_states
scoreboard players operation temp2 terf_states /= -1 terf_states

execute unless score temp terf_states matches 5 run scoreboard players operation temp2 terf_states /= -1 terf_states

execute unless score temp terf_states matches 5 run data merge block ~ ~ ~ {front_text:{messages:[{"text":"Status: "},{"text":"collider offline","color":"gray"},[{"text":"elapsed: "},{"score":{"objective":"terf_states","name":"temp2"},"color":"#E0E0E0"},{"text":"s","color":"#E0E0E0"}],{"text":"Decrs. Injection","color":"gray"}],has_glowing_text:1b,color:"white"},is_waxed:1b}

execute if score temp terf_states matches 1 run data modify block ~ ~ ~ front_text.messages[1] set value {"text":"collider running","color":"green"}
execute if score temp terf_states matches 2 run data modify block ~ ~ ~ front_text.messages[1] set value {"text":"low power!","color":"gold"}
execute if score temp terf_states matches 3 run data modify block ~ ~ ~ front_text.messages[1] set value {"text":"no valid recipe","color":"yellow"}
execute if score temp terf_states matches 4 run data modify block ~ ~ ~ front_text.messages[1] set value {"text":"⚠DANGER⚠","color":"red"}
execute if score temp terf_states matches 5 run data merge block ~ ~ ~ {front_text:{messages:[{"text":"Status: "},{"text":"⚠! ERROR !⚠","color":"red"},[{"text":"retrying in ","color":"red"},{"score":{"objective":"terf_states","name":"temp2"}},{"text":"s","color":"red"}],{"text":"Decrs. Injection","color":"gray"}],has_glowing_text:1b,color:"white"},is_waxed:1b}
execute if score temp terf_states matches 6 run data modify block ~ ~ ~ front_text.messages[1] set value {"text":"Interface Broken","color":"red"}

scoreboard players operation temp terf_states = @s datapipes_lib_power_storage
execute store result score temp2 terf_states run data get entity @s data.terf.current_recipe

scoreboard players operation temp3 terf_states = @s terf_data_A
data merge block ^1 ^ ^ {front_text:{messages:[[{"text":"In: "},{"score":{"objective":"terf_states","name":"temp"}},{"text":"MWt"}],[{"text":"Shots Left: "},{"score":{"objective":"terf_states","name":"temp3"}}],[{"text":"Material: "},{"score":{"objective":"terf_states","name":"temp2"}}],{"text":"-| Fire Collider |-","color":"gray"}],has_glowing_text:1b,color:"white"},is_waxed:1b}

scoreboard players set temp terf_states 0
scoreboard players operation temp2 terf_states = @s terf_data_C
scoreboard players operation temp2 terf_states /= 20 terf_states

scoreboard players operation temp terf_states = @s terf_data_C
scoreboard players operation temp2 terf_states = @s terf_data_D
data merge block ^-1 ^ ^ {front_text:{messages:[{"text":"Hadron Collider"},[{"text":"length: "},{"score":{"objective":"terf_states","name":"temp"}}],[{"text":"I.M: "},{"score":{"objective":"terf_states","name":"temp2"}}],{"text":"Incrs. Injection","color":"gray"}],has_glowing_text:1b,color:"white"},is_waxed:1b}