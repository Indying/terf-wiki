execute unless block ~ ~ ~ #minecraft:signs run return fail
data merge block ~ ~ ~ {front_text:{color:cyan,has_glowing_text:1b}}
data modify block ~ ~ ~ front_text.messages[0] set value {text:"Relative Ship Size",color:"white",underlined:1b}

## size X
scoreboard players set temp terf_states 0
data modify storage terf:temp args.value set value ""
data modify storage terf:temp args.value set string block ~ ~ ~ front_text.messages[1] 9
function terf:entity/machines/warp_core_panel/parse_screens/number with storage terf:temp args
#if below min size
execute if score temp terf_states matches ..2 run data modify block ~ ~ ~ front_text.messages[1] set value "from X= -3"
execute if score temp terf_states matches ..2 run scoreboard players set temp terf_states 3
#if above max size
$execute if score temp terf_states > warp_core_max_size terf_states run data modify block ~ ~ ~ front_text.messages[1] set value "from X= -$(max_size)"
execute if score temp terf_states > warp_core_max_size terf_states run scoreboard players operation temp terf_states = warp_core_max_size terf_states
scoreboard players operation @s terf_data_R = temp terf_states

## size Y
scoreboard players set temp terf_states 0
data modify storage terf:temp args.value set value ""
data modify storage terf:temp args.value set string block ~ ~ ~ front_text.messages[2] 9
function terf:entity/machines/warp_core_panel/parse_screens/number with storage terf:temp args
#if below min size
execute if score temp terf_states matches ..7 run data modify block ~ ~ ~ front_text.messages[2] set value "from Y= -8"
execute if score temp terf_states matches ..7 run scoreboard players set temp terf_states 8
#if above max size
$execute if score temp terf_states > warp_core_max_size terf_states run data modify block ~ ~ ~ front_text.messages[2] set value "from Y= -$(max_size)"
execute if score temp terf_states > warp_core_max_size terf_states run scoreboard players operation temp terf_states = warp_core_max_size terf_states
scoreboard players operation @s terf_data_S = temp terf_states

## size Z
scoreboard players set temp terf_states 0
data modify storage terf:temp args.value set value ""
data modify storage terf:temp args.value set string block ~ ~ ~ front_text.messages[3] 9
function terf:entity/machines/warp_core_panel/parse_screens/number with storage terf:temp args
#if below min size
execute if score temp terf_states matches ..2 run data modify block ~ ~ ~ front_text.messages[3] set value "from Z= -3"
execute if score temp terf_states matches ..2 run scoreboard players set temp terf_states 3
#if above max size
$execute if score temp terf_states > warp_core_max_size terf_states run data modify block ~ ~ ~ front_text.messages[3] set value "from Z= -$(max_size)"
execute if score temp terf_states > warp_core_max_size terf_states run scoreboard players operation temp terf_states = warp_core_max_size terf_states
scoreboard players operation @s terf_data_T = temp terf_states
