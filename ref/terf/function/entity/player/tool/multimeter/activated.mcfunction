scoreboard players set multimeter_block_in_sight terf_states 0
scoreboard players set terminated terf_states 0
tag @s add terf_currententity
function terf:entity/player/tool/multimeter/raycast
tag @s remove terf_currententity
execute if score multimeter_block_in_sight terf_states matches 1 run playsound terf:alarms.toolbeep player @s ~ ~ ~ 1 1
execute if score multimeter_block_in_sight terf_states matches 0 run playsound terf:alarms.toolbeep player @s ~ ~ ~ 1 0.5