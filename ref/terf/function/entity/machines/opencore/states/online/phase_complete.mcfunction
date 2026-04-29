scoreboard players set @s terf_data_E 0
data remove entity @s data.terf.stored_recipe.operations[0]

execute if data entity @s data.terf.stored_recipe.operations[1] run playsound minecraft:block.note_block.flute master @a[distance=0..] ~ ~ ~ 1 2
execute unless data entity @s data.terf.stored_recipe.operations[1] run playsound minecraft:block.note_block.flute master @a[distance=0..] ~ ~ ~ 1 0

$execute unless score core_temp_divided terf_states matches $(min)..$(max) run function terf:entity/machines/opencore/states/meltdown/start
execute unless data entity @s data.terf.stored_recipe.operations[0] run function terf:entity/machines/opencore/states/meltdown/start