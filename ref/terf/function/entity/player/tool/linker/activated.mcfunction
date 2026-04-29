scoreboard players set raytermination terf_states 0
scoreboard players set block_found terf_states 0
function terf:entity/player/tool/linker/raycast
execute if score block_found terf_states matches 0 run playsound terf:alarms.toolbeep player @a[distance=0..] ~ ~ ~ 1 0
execute if score block_found terf_states matches 0 if predicate datapipes_lib:pressing_sneak if predicate datapipes_lib:pressing_sprint unless predicate datapipes_lib:pressing_left unless predicate datapipes_lib:pressing_right unless predicate datapipes_lib:pressing_forwards unless predicate datapipes_lib:pressing_backwards run function terf:entity/player/tool/linker/clear_list
