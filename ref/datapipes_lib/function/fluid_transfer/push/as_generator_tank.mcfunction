#fail if the pipe isnt on
scoreboard players set succeeded datapipes_lib 0
$execute $(checks) run scoreboard players set succeeded datapipes_lib 1
execute if score succeeded datapipes_lib matches 0 run return fail

#add fluid amount to total amount and set it to 0
$execute store result score temp datapipes_lib run data get storage datapipes_lib:constants numbers.1 $(amount)
scoreboard players operation total_amount datapipes_lib += temp datapipes_lib
$data modify entity @s data.fluids[{id:'$(id)',checks:'$(checks)',pipe_on:'$(pipe_on)'}].amount set value 0
tag @s add datapipes_lib_current_fluid_generators
