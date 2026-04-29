#special case for when terf_oldmapadditions is installed
scoreboard players set succeeded terf_states 0
execute if score @s terf_data_X matches -28..171 if score @s terf_data_Y matches 41..241 if score @s terf_data_Z matches -31..169 run scoreboard players set succeeded terf_states 1
execute if score oldmapadditions_installed terfmap_states matches 1 if dimension minecraft:overworld if score succeeded terf_states matches 0 run return run scoreboard players set @s terf_data_B 2147483647

## Check for world border, this assumes the worldborder center is 0;0 but its the best we can do
execute store result score worldborder_size terf_states run worldborder get
scoreboard players operation worldborder_size terf_states /= 2 terf_states
execute if score @s terf_data_X > worldborder_size terf_states run return fail
execute if score @s terf_data_Z > worldborder_size terf_states run return fail
scoreboard players operation worldborder_size terf_states *= -1 terf_states
execute if score @s terf_data_X < worldborder_size terf_states run return fail
execute if score @s terf_data_Z < worldborder_size terf_states run return fail

## Check blocks
#load an area as big as maximum wc size
execute in terf:intermediary_technical_storage_dimension positioned -30000000 0 -30000000 run forceload add ~ ~ ~151 ~151

#load target chunks
$forceload add ~ ~ ~$(size_x) ~$(size_z)

#check if the target is outside of the world with a block that we know never exists
tag @s add terf_target_blocks_outside_world
$execute unless block ~ ~ ~ red_glazed_terracotta unless block ~$(size_x) ~$(size_y) ~$(size_z) red_glazed_terracotta run tag @s remove terf_target_blocks_outside_world
$execute if entity @s[tag=terf_target_blocks_outside_world] run return run forceload remove ~ ~ ~$(size_x) ~$(size_z)

#no, i cant just use clone to count blocks because mojang thought it would be funny if barriers didnt count towards "Successfully cloned ... block(s)" in /clone
#clone blocks to storage dimension
$clone ~ ~ ~ ~$(size_x) ~$(size_y) ~$(size_z) to terf:intermediary_technical_storage_dimension -30000000 0 -30000000 masked
#replace all blocks in the storage dimension with air using fill, basically counting how many blocks are not air
$execute in terf:intermediary_technical_storage_dimension positioned -30000000 0 -30000000 store result score @s terf_data_B run fill ~ ~ ~ ~$(size_x) ~$(size_y) ~$(size_z) air replace

#unload target chunks
$forceload remove ~ ~ ~$(size_x) ~$(size_z)
