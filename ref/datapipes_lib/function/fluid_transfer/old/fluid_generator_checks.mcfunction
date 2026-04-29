scoreboard players set succeeded datapipes_lib 0
$execute $(checks) run scoreboard players set succeeded datapipes_lib 1
execute if score succeeded datapipes_lib matches 0 run return fail

$scoreboard players add total_amount datapipes_lib $(amount)
$data modify entity @s data.fluids[{id:'$(id)'}].amount set value 0
tag @s add datapipes_lib_current_fluid_generators

return fail
#if the function is missing this argument, it wont parse
$$(pipe_on)