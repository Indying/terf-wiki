execute unless block ~ ~ ~ #minecraft:signs run return fail
data merge block ~ ~ ~ {front_text:{color:green,has_glowing_text:1b}}
data modify block ~ ~ ~ front_text.messages[0] set value {text:"Target Dimension:",color:"white"}
data modify block ~ ~ ~ front_text.messages[1] set value ""

data modify storage terf:temp args.ns set string block ~ ~ ~ front_text.messages[2] 4
data modify storage terf:temp args.dim set string block ~ ~ ~ front_text.messages[3] 1
scoreboard players set succeeded terf_states 0
function terf:entity/machines/warp_core_panel/parse_screens/dimension with storage terf:temp args
execute if score succeeded terf_states matches 1 run return fail
data modify block ~ ~ ~ front_text.messages[2] set value "ns: minecraft"
data modify block ~ ~ ~ front_text.messages[3] set value ">overworld"
data modify entity @s data.terf.dim set value "minecraft:overworld"