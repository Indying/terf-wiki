#keypad detection
scoreboard players set temp3 terf_states 0
scoreboard players set temp2 terf_states 0

$execute as @e[type=minecraft:interaction,tag=terf_related_$(machine_id),tag=!terf_reader] if data entity @s interaction run function terf:entity/machines/security_terminal/keypad_buttons

execute if score temp3 terf_states matches 1 run function terf:entity/machines/security_terminal/keypad_pressed

data modify block ~ ~1 ~ front_text.messages[0] set value {"text":"Enter Identifier","color":"#002200","click_event":{"action":"run_command","command":"data merge block ~ ~ ~ {front_text:{color:\"gray\"}}"}}
data modify block ~ ~1 ~ front_text.has_glowing_text set value 1b
data modify block ~ ~1 ~ is_waxed set value 1b

#check to add or remove
data modify storage terf:temp temp set from block ~ ~1 ~ front_text.messages[1]

scoreboard players set temp terf_states -1
scoreboard players set succeeded terf_states 0
data modify storage terf:temp args.id set from storage terf:temp temp
function terf:entity/machines/security_terminal/check_id with storage terf:temp args

execute if score succeeded terf_states matches 1 run data modify block ~ ~1 ~ front_text.color set value "green"
execute if score succeeded terf_states matches 0 run data modify block ~ ~1 ~ front_text.color set value "red"

scoreboard players set succeeded terf_states 0
execute store result storage terf:temp args.id int 1 run scoreboard players get temp terf_states
function terf:entity/machines/security_terminal/is_player_added with storage terf:temp args

execute if score succeeded terf_states matches 1 run data modify block ~ ~1 ~ front_text.messages[2] set value {"text":"Already present","color":"#002200"}
execute if score succeeded terf_states matches 1 run data modify block ~ ~1 ~ front_text.messages[3] set value {"text":"enter to remove","color":"#002200"}

execute if score succeeded terf_states matches 0 run data modify block ~ ~1 ~ front_text.messages[2] set value ""
execute if score succeeded terf_states matches 0 run data modify block ~ ~1 ~ front_text.messages[3] set value {"text":"enter to update","color":"#002200"}
