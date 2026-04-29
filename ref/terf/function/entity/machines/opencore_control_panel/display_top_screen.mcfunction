$scoreboard players set time terf_states $(time)
scoreboard players operation time terf_states -= @s terf_data_E
scoreboard players operation time terf_states /= 20 terf_states
execute if score time terf_states matches ..-1 run scoreboard players set time terf_states 0

scoreboard players set succeeded terf_states 0
$execute if score core_temp_divided terf_states matches $(min)..$(max) run scoreboard players set succeeded terf_states 1

$execute if data entity @s data.terf.stored_recipe.operations[1] if score succeeded terf_states matches 0 run data merge block ^ ^2 ^1 {front_text:{messages:[{"text":"phase: $(desc)","color":"aqua"},{"text":"Set temp to:"},{"text":"$(min)..$(max)°C","color":"red"},[{"text":"Time Left: "},{"score":{"name":"time","objective":"terf_states"}},{"text":"s"}]]}}
$execute if data entity @s data.terf.stored_recipe.operations[1] if score succeeded terf_states matches 1 run data merge block ^ ^2 ^1 {front_text:{messages:[{"text":"phase: $(desc)","color":"aqua"},{"text":"Set temp to:"},{"text":"$(min)..$(max)°C","color":"green"},[{"text":"Time Left: "},{"score":{"name":"time","objective":"terf_states"}},{"text":"s"}]]}}
execute if data entity @s data.terf.stored_recipe.operations[1] if score succeeded terf_states matches 1 run scoreboard players add @s terf_data_E 2

$execute unless data entity @s data.terf.stored_recipe.operations[1] run data merge block ^ ^2 ^1 {front_text:{messages:[{"text":"phase: $(desc)","color":"aqua"},{"text":"Please shut","color":"dark_aqua"},{"text":"down the","color":"dark_aqua"},{"text":"OpenCore!","color":"dark_aqua"}]}}
