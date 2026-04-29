data merge block ~ ~ ~ {front_text:{color:"white",has_glowing_text:1b}}
data modify block ~ ~ ~ front_text.messages[0] set value {"text":"High-Power Laser"}
data modify block ~ ~ ~ front_text.messages[1] set value {"text":"enter power level","color":"gray"}
data modify block ~ ~ ~ front_text.messages[3] set value {"text":"==============","color":"gray"}

scoreboard players set power terf_states 1
data modify storage terf:temp args.value set from block ~ ~ ~ front_text.messages[2]
function terf:entity/machines/laser/check_screen_args with storage terf:temp args