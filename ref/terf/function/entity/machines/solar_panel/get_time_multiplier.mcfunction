execute unless function terf:require/is_dimension_not_space run return run scoreboard players set time_multiplier terf_states 6000
execute if dimension minecraft:the_end run return run scoreboard players set time_multiplier terf_states 2000

#if not defined, get sun phase
execute store result score time_multiplier terf_states run time query daytime
scoreboard players operation temp terf_states = time_multiplier terf_states
scoreboard players remove temp terf_states 6000
scoreboard players operation temp terf_states *= 2 terf_states
execute if score temp terf_states matches 1.. run scoreboard players operation time_multiplier terf_states -= temp terf_states
