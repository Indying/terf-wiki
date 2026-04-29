execute store result score calc terf_states run data get entity @s data.terf.security_config
scoreboard players operation calc2 terf_states = @s terf_data_B
execute if score @s terf_data_A matches 1.. run data merge block ~ ~1 ~ {is_waxed:1b,front_text:{has_glowing_text:1b,color:"green",messages:[{"text":"Security Terminal","color":"#002200","click_event":{"action":"run_command","command":"data merge block ~ ~ ~ {front_text:{color:\"gray\"}}"}},[{"text":"whitelisted: ","color":"white"},{"score":{"name":"calc","objective":"terf_states"}}],[{"text":"updated: ","color":"white"},{"score":{"name":"calc2","objective":"terf_states"}}],{"text":"Click to Whitelist","color":"#002200"}]}}
execute if score @s terf_data_A matches 1.. run return run scoreboard players set @s terf_data_A 0
scoreboard players add @s terf_data_A 1

data modify block ~ ~1 ~ front_text.messages[1] set value ""
data modify storage terf:temp args set value {arg1:"execute as @e[type=minecraft:interaction,tag=terf_related_",arg3:"] run data remove entity @s interaction"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

