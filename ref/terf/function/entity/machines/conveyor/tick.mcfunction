scoreboard players add @s terf_data_A 1
execute unless score @s terf_data_A matches 8.. run return fail

scoreboard players set @s terf_data_A 0
scoreboard players set terminated terf_states 256
function terf:entity/machines/conveyor/check
execute if score terminated terf_states matches ..0 run function terf:entity/machines/multiblock_core_destroy
execute if score terminated terf_states matches ..0 run function terf:entity/machines/conveyor/explode