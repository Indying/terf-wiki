#check to add or remove
scoreboard players set succeeded terf_states 0
data modify storage terf:temp args.id set from block ~ ~1 ~ front_text.messages[1]
function terf:entity/machines/security_terminal/secure_parse with storage terf:temp args

execute if score @s terf_data_A matches 1 if score succeeded terf_states matches 0 run function terf:entity/machines/security_terminal/add_id with storage terf:temp args
execute if score @s terf_data_A matches 1 if score succeeded terf_states matches 1 run function terf:entity/machines/security_terminal/remove_id with storage terf:temp args

#set the id of linked machines
data modify storage terf:temp temp set from entity @s data.terf.security_config
scoreboard players operation temp terf_states = @s terf_connected_mainframe

scoreboard players set temp2 terf_states 0
$execute as @e[type=minecraft:marker,tag=terf_linked_to_$(machine_id)] if score @s terf_connected_mainframe = temp terf_states run function terf:entity/machines/security_terminal/as_linked_machines
scoreboard players operation @s terf_data_B = temp2 terf_states

execute if score @s terf_data_A matches 1 run data modify block ~ ~1 ~ front_text.messages[1] set value ""