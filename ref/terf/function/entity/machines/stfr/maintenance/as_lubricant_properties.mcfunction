scoreboard players set temp terf_states 1
$scoreboard players set lubricant_effectiveness terf_states $(lubricant)

scoreboard players operation temp2 terf_states = @s terf_data_T
scoreboard players operation temp2 terf_states %= lubricant_effectiveness terf_states
execute unless score temp2 terf_states matches 0 run return fail

scoreboard players remove lubricant_amount terf_states 1
execute store result entity @s data.fluids[2].amount int 1 run scoreboard players get lubricant_amount terf_states
