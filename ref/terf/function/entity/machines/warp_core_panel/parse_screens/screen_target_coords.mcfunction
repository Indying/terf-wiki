execute unless block ~ ~ ~ #minecraft:signs run return fail
data merge block ~ ~ ~ {front_text:{color:green,has_glowing_text:1b}}
data modify block ~ ~ ~ front_text.messages[0] set value {text:"Target Coords.:",color:"white"}

## target X
scoreboard players set succeeded terf_states 0
data modify storage terf:temp args.value set value ""
data modify storage terf:temp args.value set string block ~ ~ ~ front_text.messages[1] 3
function terf:entity/machines/warp_core_panel/parse_screens/number with storage terf:temp args
#if invalid, set to current coords
$execute if score succeeded terf_states matches 0 run data modify block ~ ~ ~ front_text.messages[1] set value "X: $(x)"
execute if score succeeded terf_states matches 0 run scoreboard players operation temp terf_states = dx terf_states
scoreboard players operation temp terf_states -= @s terf_data_R
scoreboard players operation @s terf_data_X = temp terf_states

## target Y
scoreboard players set succeeded terf_states 0
data modify storage terf:temp args.value set value ""
data modify storage terf:temp args.value set string block ~ ~ ~ front_text.messages[2] 3
function terf:entity/machines/warp_core_panel/parse_screens/number with storage terf:temp args
#if invalid, set to current coords
$execute if score succeeded terf_states matches 0 run data modify block ~ ~ ~ front_text.messages[2] set value "Y: $(y)"
execute if score succeeded terf_states matches 0 run scoreboard players operation temp terf_states = dy terf_states
scoreboard players operation @s terf_data_Y = temp terf_states

## target Z
scoreboard players set succeeded terf_states 0
data modify storage terf:temp args.value set value ""
data modify storage terf:temp args.value set string block ~ ~ ~ front_text.messages[3] 3
function terf:entity/machines/warp_core_panel/parse_screens/number with storage terf:temp args
#if invalid, set to current coords
$execute if score succeeded terf_states matches 0 run data modify block ~ ~ ~ front_text.messages[3] set value "Z: $(z)"
execute if score succeeded terf_states matches 0 run scoreboard players operation temp terf_states = dz terf_states
scoreboard players operation temp terf_states -= @s terf_data_T
scoreboard players operation @s terf_data_Z = temp terf_states
