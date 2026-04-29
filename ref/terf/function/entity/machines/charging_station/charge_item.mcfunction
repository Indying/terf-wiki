$execute store result score temp terf_states run data get block ~ ~ ~ Items[{Slot:$(slot)b}].components.minecraft:damage
execute if score temp terf_states matches 0 run return fail

execute if score @s datapipes_lib_power_storage matches 4000.. run scoreboard players remove temp terf_states 40
scoreboard players add power_usage terf_states 4000

execute if score temp terf_states matches ..1 run scoreboard players set temp terf_states 0
$execute store result block ~ ~ ~ Items[{Slot:$(slot)b}].components.minecraft:damage int 1 run scoreboard players get temp terf_states